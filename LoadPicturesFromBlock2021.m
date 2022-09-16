function [pictureBlock, nbPicturesLoaded, destinationRect,fileNum] = LoadPicturesFromBlock2021(folderToLoadFrom,folderToLoadFrom2, nbFilesExpected, win, rescaleRatio,samef)

folderToLoadFrom = fullfile(folderToLoadFrom);
if samef==2
    folderToLoadFrom2 = fullfile(folderToLoadFrom2);

elseif samef==3
    folderToLoadFrom2 = fullfile(folderToLoadFrom2);

elseif samef==4
    folderToLoadFrom2 = fullfile(folderToLoadFrom2);

elseif samef==5
    folderToLoadFrom2 = fullfile(folderToLoadFrom2);
end


[W, H] = Screen('WindowSize', win);
% Might have to use a full path.
listing = dir([folderToLoadFrom,'/*.bmp']);
[nbFiles, ~] = size(listing);
if samef==2
    listing2 = dir([folderToLoadFrom2,'/*.bmp']);
    [nbFiles2, ~] = size(listing2);

elseif samef==3
    listing2 = dir([folderToLoadFrom2,'/*.bmp']);
    [nbFiles2, ~] = size(listing2);

elseif samef==4
    listing2 = dir([folderToLoadFrom2,'/*.bmp']);
    [nbFiles2, ~] = size(listing2);

elseif samef==5
    listing2 = dir([folderToLoadFrom2,'/*.bmp']);
    [nbFiles2, ~] = size(listing2);
end

%Checks that we were able to find all of the expected files.
% if(nbFiles ~= 200)
%     error('Unexpected number of files in directory : %d vs %d expected', nbFiles, nbFilesExpected);
% end

nbPicturesLoaded = 0;
pictureBlock = [];
imagedouble=ones(768,2324,3)*255;
for idx = 1:140

    % Gets a filename from the full listing.
    fileName = listing(idx).name;
    if samef==2
       fileName2 = listing2(idx).name;
   
    elseif samef==3
        fileName2 = listing2(idx).name;
    
    
    elseif samef==4
        fileName2 = listing2(idx).name;
   
    
   elseif samef==5
        fileName2 = listing2(idx).name;
    end
    % Get the number from the file name.  Considering the filename format {number}.bmp:
    % get '.' position
    dotPos = strfind(fileName, '.');
    dotPos = dotPos(1);
    fileNum(idx) = str2num(fileName(4 : dotPos - 1));
    
    if samef==2
        dotPos2 = strfind(fileName2, '.');
        dotPos2 = dotPos2(1);
        fileNum2(idx) = str2num(fileName2(4 : dotPos2 - 1));
        % Concatenate path with name
        filePath2 = fullfile(folderToLoadFrom2, fileName2);
        
        % Reads the file
        theImage2 = imread(filePath2);
   
     elseif samef==3
        dotPos2 = strfind(fileName2, '.');
        dotPos2 = dotPos2(1);
        fileNum2(idx) = str2num(fileName2(4 : dotPos2 - 1));
        % Concatenate path with name
        filePath2 = fullfile(folderToLoadFrom2, fileName2);
        
        % Reads the file
        theImage2 = imread(filePath2);
 
    
    elseif samef==4
        dotPos2 = strfind(fileName2, '.');
        dotPos2 = dotPos2(1);
        fileNum2(idx) = str2num(fileName2(4 : dotPos2 - 1));
        % Concatenate path with name
        filePath2 = fullfile(folderToLoadFrom2, fileName2);
        
        % Reads the file
        theImage2 = imread(filePath2);
 
    
    elseif samef==5
        dotPos2 = strfind(fileName2, '.');
        dotPos2 = dotPos2(1);
        fileNum2(idx) = str2num(fileName2(4 : dotPos2 - 1));
        % Concatenate path with name
        filePath2 = fullfile(folderToLoadFrom2, fileName2);
        
        % Reads the file
        theImage2 = imread(filePath2);
    end
    
    
    
    
    
    
    % Concatenate path with name
    filePath = fullfile(folderToLoadFrom, fileName);
    
    % Reads the file
    theImage = imread(filePath);

    % Get the size of the image
    [s1, s2, s3] = size(theImage);
    
    imagedouble(1:768,1:512,:) = theImage; %512
    if samef==1
        imagedouble(1:768,1813:2324,:)=theImage;
    end    
    if samef==2
        imagedouble(1:768,1813:2324,:)=theImage2;
    
    end
    if samef==3
        imagedouble(1:768,1813:2324,:)=theImage2;
    
    end
    if samef==4
        imagedouble(1:768,1813:2324,:)=theImage2;
  
    end
    if samef==5
        imagedouble(1:768,1813:2324,:)=theImage2;
 
    end
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

% if(nbPicturesLoaded ~= 200)
%     error('Unexpected number of files loaded : %d vs %d expected', nbPicturesLoaded, nbFilesExpected);
end

