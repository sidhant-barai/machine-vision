im = imread('Two_colour.jpg');
figure, imshow(im)

red_channel = im(:, :, 1);
green_channel = im(:, :, 2);
blue_channel = im(:, :, 3);

