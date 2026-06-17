% Load the video
videoReader = VideoReader('red_square_video.mp4');
ground_truth = load('red_square_gt.mat');
MyMatrix=cell2mat(struct2cell(ground_truth));

% Create an optical flow object
opticFlow = opticalFlowLK('NoiseThreshold', 0.01);

% Read the first frame
firstFrame = readFrame(videoReader);

% Convert the first frame to grayscale
grey_first = rgb2gray(firstFrame);


% Detect corners in the first frame
C0 = corner(grey_first, 1);

% Initialize track to store corner positions
track = zeros(videoReader.NumFrames, 2);
track(1, :) = C0;

% Estimate optical flow for the first frame
flow = estimateFlow(opticFlow, grey_first);

plot_frame = 0;

numFrames = videoReader.NumFrames;

for frameIndex = 2:numFrames
    % Read the current frame
    frame = readFrame(videoReader);

    if frameIndex == numFrames
        plot_frame = frame;
    end

    % Convert the frame to grayscale
    grey_frame = rgb2gray(frame);

        % Detect corners in the current frame
        C = corner(grey_frame);

        [~,index] = min(pdist2(track(end,:), C));

        % Extract the nearest corner point
        nearestCorner = C(index, :);

        % Get the coordinates of the nearest corner point
        corner_x = nearestCorner(1);
        corner_y = nearestCorner(2);

        % Get the velocity components from the optical flow object
        vx = flow.Vx(round(corner_y), round(corner_x));
        vy = flow.Vy(round(corner_y), round(corner_x));

        % Compute the new position by adding the velocity vector to the current position
        x_new = corner_x + vx;
        y_new = corner_y + vy;

        % Update the track with the new position
        track(frameIndex, :) = [x_new, y_new];
end

imshow(plot_frame)
hold on
plot(MyMatrix(:,1), MyMatrix(:,2))
hold on
plot(track(:,1), track(:,2))
hold off

