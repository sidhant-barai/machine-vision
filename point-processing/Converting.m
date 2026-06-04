im = imread('duckMallardDrake.jpg');
figure, imshow(im)

[nr, nc, np] = size(im)
newIm = zeros(nr,nc,np);
newIm = uint8(newIm);

for r = 1:nr
    for c = 1:nc
        if( im(r,c,1)>180 && im(r,c,2)>180 && im(r,c,3)>180)
            newIm(r,c,1) = 255;
            newIm(r,c,2) = 255;
            newIm(r,c,3) = 0;
        else 
            for p = 1:np
                newIm (r,c,p) = im(r,c,p);
            end
        end
    end
end

figure, imshow(newIm)