
clc;
clear;
close all;
%mov = yuv4mpeg2mov('SomeFile.y4m');

[mov, videoInfo] = yuv4mpeg2mov('news_cif.y4m');
n1               = videoInfo.height;
n2               = videoInfo.width;
n3               = videoInfo.frameCount;
temp             = zeros(n1/2, n2/2, n3);

for i = 1:n3
    data = mov(1,i);
    g = rgb2gray(data.cdata);
    imshow(g,[])
    g = imresize(g,0.5);
    temp(:,:,i) = g;
end
templ = temp(:,:,1:150);
Newsno_Ohsi = templ;
save('Newsno_Ohsi.mat', 'Newsno_Ohsi')

if max(templ(:))>1
    tempk = my_normalized(templ);
end
News_Ohsi = tempk;
save('News_Ohsi.mat', 'News_Ohsi')
implay(tempk);
