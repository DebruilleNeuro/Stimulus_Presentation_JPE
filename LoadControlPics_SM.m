function [pictureBlock, nbPicturesLoaded, destinationRect,files70] = LoadControlPics_SM(folderToLoadFrom,folderToLoadFrom2, nbFilesExpected, win, rescaleRatio,samef)

This function loads images from given folders and sets the
%display parameters on the screen (e.g picture A and B will have X resolution and be on the
%left and right of the screen respectively)
%
%FOR ANNONATED VERSION: GO TO LOADBLOCKPICS_SM.m
%
%This function is the same as loadblockpics_sm, the differences are the
%input and output number of images. This script is only for Different
%images conditions (i.e when 2 pics from 2 folders are presented on one
%screen as opposed to one picture duplicated presented to both
%participants)

folderToLoadFrom = fullfile(folderToLoadFrom);

folderToLoadFrom2 = fullfile(folderToLoadFrom2);


[W, H] = Screen('WindowSize', win);
% Might have to use a full path.
listing = dir([folderToLoadFrom,'/*.bmp']);
[nbFiles, ~] = size(listing);

listing2 = dir([folderToLoadFrom2,'/*.bmp']);
[nbFiles2, ~] = size(listing2);

nbPicturesLoaded = 0;
pictureBlock = [];
imagedouble=ones(768,2324,3)*255;


for idx = 1:70
    
    % Gets a filename from the full listing.
    
    fileName = listing(idx).name;
    fileName2 = listing2(idx).name;
        
        dotPos2 = strfind(fileName2, '.');
        dotPos2 = dotPos2(1);
        files70(idx) = str2num(fileName2(4 : dotPos2 - 1));
        % Concatenate path with name
        filePath2 = fullfile(folderToLoadFrom2, fileName2);
        
        % Reads the file
        theImage2 = imread(filePath2);
    
    %     Get the number from the file name.  Considering the filename format {number}.bmp:
    % get '.' position
    dotPos = strfind(fileName, '.');
    dotPos = dotPos(1);
    files70(idx) = str2num(fileName(4 : dotPos - 1));
    
    % Concatenate path with name
    filePath = fullfile(folderToLoadFrom, fileName);
    
    % Reads the file
    theImage = imread(filePath);
    
    % Get the size of the image
    [s1, s2, s3] = size(theImage);
    
    imagedouble(1:768,1:512,:) = theImage; %512
    
  
        imagedouble(1:768,1813:2324,:)=theImage2;
   
    
    % Here we check if the image is too big to fit on the screen and abort if
    % it is.
    % if s1 > W || s2 > H
    %    error('ERROR! Image is too big to fit on the screen');
    %end
    
    % rescale the image
    ratio = s2/s1;
    Hpict = rescaleRatio*s1/8;
    Wpict = Hpict*ratio*3.75;
    initRect = [0 0 Wpict Hpict];
    destinationRect = CenterRectOnPoint(initRect, W/2, H/2);
    
    %5.7 in horizontal
    %3in vertival
    
    % Make the image into a texture
    imageTexture = Screen('MakeTexture', win, imagedouble);
    
    % Add the picture to the block.
    pictureBlock = [pictureBlock imageTexture];
    
    % Increment the image counter.
    nbPicturesLoaded = nbPicturesLoaded + 1;
    
end
end
