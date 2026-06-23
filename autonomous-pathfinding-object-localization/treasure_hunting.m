close all; 
clear all;

%% Reading image
im = imread('Treasure_hard.jpg'); % change name to process other images  
imshow(im);
pause;

%% Binarisation
bin_threshold = 0.1; % parameter to vary
bin_im = im2bw(im, bin_threshold);
imshow(bin_im);
pause;

%% Extracting connected components
con_com = bwlabel(bin_im);
imshow(label2rgb(con_com));
pause;

%% Computing objects properties
props = regionprops(con_com);

%% Drawing bounding boxes
n_objects = numel(props);
imshow(im);
hold on;
for object_id = 1 : n_objects
    rectangle('Position', props(object_id).BoundingBox, 'EdgeColor', 'b');
end
hold off;
pause;


%% Arrow/non-arrow determination
arrow_ind = arrow_finder(props,yellow_props(im));  

%% Finding red arrow
n_arrows = numel(arrow_ind);
start_arrow_id = 0;
% check each arrow until find the red one
for arrow_num = 1 : n_arrows
    object_id = arrow_ind(arrow_num);    % determine the arrow id

    % extract colour of the centroid point of the current arrow
    centroid_colour = im(round(props(object_id).Centroid(2)), round(props(object_id).Centroid(1)), :); 
    if centroid_colour(:, :, 1) > 240 && centroid_colour(:, :, 2) < 10 && centroid_colour(:, :, 3) < 10
	% the centroid point is red, memorise its id and break the loop
        start_arrow_id = object_id;
        break;
    end
end


%% Hunting
cur_object = start_arrow_id; % start from the red arrow
path = [];
treasure_id = [];
last_obj_status = 0;
 while(last_obj_status==0)
    %If the current object is an arrow, add it to the path and compute the next object
    while ismember(cur_object, arrow_ind(1,:))  
        path(end + 1) = cur_object;
        %Function to find the next object pointed by the current object
        cur_object = next_object_finder(cur_object,path,props,yellow_props(im),im,arrow_ind,treasure_id);  
    end
    %If the current object is not an arrow then add it to the treasure
    treasure_id(end + 1) = cur_object;
    %Computing next object pointed by the last arrow in the path while ignoring the identified %treasure objects
    [cur_object last_obj_status] = next_object_finder(path(end),path,props,yellow_props(im),im,arrow_ind,treasure_id);
 end

%% visualisation of the path
imshow(im);
hold on;
for path_element = 1 : numel(path)
    object_id = path(path_element); % determine the object id
    rectangle('Position', props(object_id).BoundingBox, 'EdgeColor', 'y');
    str = num2str(path_element);
    text(props(object_id).BoundingBox(1), props(object_id).BoundingBox(2), str, 'Color', 'r', 'FontWeight', 'bold', 'FontSize', 14);
end

% visualisation of the treasure
count =1;
for i =[treasure_id]
    rectangle('Position', props(i).BoundingBox, 'EdgeColor', 'g');
end




%Function for extracting yellow dots component
function yellow_prop = yellow_props(im)
    
    yellow_dots = im(:,:,1)>150 & im(:,:,2)>200 & im(:,:,3)<100;  % Color condition
    yellow_dots = uint8(yellow_dots); 			  
    yellow_im_concom = bwlabel(yellow_dots);      
    yellow_prop = regionprops(yellow_im_concom); 

end

% Function to find the arrow ID
function [arrow_finderr] = arrow_finder(props, yellow_props)
    nprops = length(props);
    n_yel_props = length(yellow_props);
    arrow_finderr = [];
    for r = 1:nprops
        for s = 1:n_yel_props
            if(obj_chk(yellow_props(s).Centroid,props(r).BoundingBox))
                arrow_finderr(1,end+1) = r;
                arrow_finderr(2,end) = s;
            
                break;
            end
        end        
    end
end



% Function to check the objects within the bounding box
function obj_check = obj_chk(k,l)
    if(k(1) > l(1) && k(1)<(l(1)+l(3)) && k(2)>l(2) && k(2)<(l(2)+l(4)))
       obj_check= true;
    else
        obj_check= false;
    end

end

% Function to find the next object
function [next_object, last_obj_status] = next_object_finder(cur_object, path, props, yellow_props, im, arrow_ind, treasure_id)
    next_object = [];
    last_obj_status = 0;
    object_centroid = props(cur_object).Centroid;
    yellow_id = find(arrow_ind(1, :) == cur_object);
    yellow_centroid = yellow_props(arrow_ind(2, yellow_id)).Centroid;
    vector = yellow_centroid - object_centroid;
    
    % Calculating the direction vector
    direction = vector / max(abs(vector));

    % Creating a list of objects to consider
    object_list = setdiff(1:numel(props), [treasure_id path]);
    disp(object_list)
    % Checking if object_list is empty
    if isempty(object_list)
        last_obj_status = 1;
        return;
    end

    % Extending the directional vector
    direction_vector = object_centroid + vector + direction;

    % Finding next object
    while abs(direction_vector(1)) <= size(im, 2) && abs(direction_vector(2)) <= size(im, 1) && isempty(next_object)
        % Checking if any object is within the bounding box of the direction vector
        obj_indices = find(arrayfun(@(i) obj_chk(direction_vector, props(i).BoundingBox), object_list));
        if ~isempty(obj_indices)
            next_object = object_list(obj_indices(1));
        end
        direction_vector = direction_vector + direction;
    end

    % If there is no next object found adding a check
    if isempty(next_object)
        last_obj_status = 1;
    end
end



