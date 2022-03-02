%Read image 
I=imread('D:\4th year\Image\OneDrive_2021-12-28\Projects Description\Traffic Sign Detection and Recognition\Traffic Test cases\Case 1\3.jpg');
%Convert it to gray
grayimage=rgb2gray(I);
%Show image
figure,imshow(I),title("original image");
%Show histogram
figure,imhist(grayimage),title("Histogram");
%Init variable
r=0;
g=0;
y=0;
%%Get the theshold
%%level = graythresh(grayimage);not acurate(0.5333)
%%the accurate (0.3)
%Convert grayimage to binary image
z=im2bw(grayimage,0.3);
%returns the lengths of the queried dimensions 
[h,w,s]=size(z);
%Divide image into 3 parts
partt= floor(h/3);
%Red part  
for i=1:partt
    for j=1:w
    if(z(i,j)==1)
        r=r+1;        
    end
    end
end
%Yellow part  
for i=partt+1:h-partt
    for j=1:w
    if(z(i,j)==1)
        y=y+1;   
    end
    end
end

%Green part  
for i=h-partt+1:h
    for j=1:w
    if(z(i,j)==1)
        g=g+1;       
    end
    end
end
%Show image and detect the circle 
figure,imshow(z),title("Detection light");
[centers,radii] = imfindcircles(z,[30 60],'ObjectPolarity','bright','Sensitivity',0.9);
h1=viscircles(centers,radii,'color','b');
%identify the color
if(r>g&&r>y)
    traffic_light='red';
elseif(g>r&&g>y)
    traffic_light='green';
elseif(y>r&&y>g)
    traffic_light='yellow';
end
%display color
disp(traffic_light);