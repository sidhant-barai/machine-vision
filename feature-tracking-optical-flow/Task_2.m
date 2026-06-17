im1 = imread('GingerBreadMan_first.jpg');
im2 = imread('GingerBreadMan_second.jpg');

im1_grey = rgb2gray(im1);
im2_grey = rgb2gray(im2);
opticalFlow = opticalFlowLK('NoiseThreshold',0.009);

flow1 = estimateFlow(opticalFlow, im1_grey);
flow2 = estimateFlow(opticalFlow, im2_grey);

h = figure;
movegui(h);
hViewPanel = uipanel(h,'Position',[0 0 1 1],'Title','Plot of Optical Flow Vectors');
hPlot = axes(hViewPanel);

hold on 
plot(flow2, 'DecimationFactor',[5 5],'ScaleFactor',10,'Parent',hPlot);
hold off

