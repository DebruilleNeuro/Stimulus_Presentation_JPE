
function [pictureBlock, nbPicturesLoaded, destinationRect,files140] = LoadBlockPics_SM(folderToLoadFrom,folderToLoadFrom2, nbFilesExpected, win, rescaleRatio,samef)

%FUNCTION
%This function loads pictures from given folders and defines the
%presentation on Screen (e.g picture A will have X resolution and be on the
%left of the screen )
%
%%%INPUT given to function:
%%samef (=1,2): 1 is for condition Same pictures and 2 Different pictures
%shown.
%%folderToLoadFrom and folderToLoadfrom2: paths to folder A and B for conditions Same
%images and Different images. For condition Same images only images from
%folder one folder are needed and doubled on screen. For condition
%Different images, images from 2 folders are loaded and put on screen.
%nbfilesexpected: 140 files expected in each folder
%win: returns parameters of the screen 
%
%%%OUTPUT [pictureBlock, nbPicturesLoaded, destinationRect,files140]
%pictureBlock: all pictures loaded
%nbPicturesLoaded: image counter here 140*3 (condition same pics and different pics), grows as loop progresses
%destinationRect: positions of images on screen for display
%files140: number of files (i.e 140*3)

 %fullfile builds a full file specification from the specified folder and file names
 %(e.g 'folderA' + '/' + 'fileA'). folderToLoadFrom = path A to stimulus
 %folder defined in Main script. 
folderToLoadFrom = fullfile(folderToLoadFrom);
if samef==2
    folderToLoadFrom2 = fullfile(folderToLoadFrom2); %path B to other folder of pictures (samef==2 = condition DBD)
end
[W, H] = Screen('WindowSize', win); %Return the width and height of a window or screen in units of pixels

listing = dir([folderToLoadFrom,'/*.bmp']); %dir lists folder contents (here listing will return list of bmp files in folderToLoadFrom
[nbFiles, ~] = size(listing); %size gives number of files in folder
if samef==2
    listing2 = dir([folderToLoadFrom2,'/*.bmp']); %same as listing but for the second folder
    [nbFiles2, ~] = size(listing2);
end

%Checks that we were able to find all of the expected files.
if(nbFiles ~= 140)
    error('Unexpected number of files in directory : %d vs %d expected', nbFiles, nbFilesExpected);
end

nbPicturesLoaded = 0; %initializing of variable 
pictureBlock = []; %initializing of variable
imagedouble=ones(768,2324,3)*255; %set resolution pictures 
for idx = 1:140 %loop will repeat for the amount of pictures in folder (eg idx= 140 pictures)

    % Gets a filename from the full listing (folder A)
    fileName = listing(idx).name;
    if samef==2
        fileName2 = listing2(idx).name; %(same for folder B)
    end
    % Get the number from the file name.  Considering the filename format {number}.bmp:
    % get '.' position
    dotPos = strfind(fileName, '.');
    dotPos = dotPos(1);
    files140(idx) = str2num(fileName(4 : dotPos - 1)); %for files 1:140 in folder A gets the 4 characters before the dot
     % Concatenate path with name
    filePath = fullfile(folderToLoadFrom, fileName);%full path + filename for each file
    
    if samef==2 %same for folder B
        dotPos2 = strfind(fileName2, '.');
        dotPos2 = dotPos2(1);
        files140(idx) = str2num(fileName2(4 : dotPos2 - 1));
        % Concatenate path with name
        filePath2 = fullfile(folderToLoadFrom2, fileName2); 
        
        % Reads the file
        theImage2 = imread(filePath2); %imread loads picture B from full path in and stores in variable 'theImage2'
    end
    
    % Reads the file
    theImage = imread(filePath); %imread loads picture from full path in variable theImage

    % Get the size of the image
    [s1, s2, s3] = size(theImage);
    
    imagedouble(1:768,1:512,:) = theImage; %position image A (eg left of screen)
    if samef==2
        imagedouble(1:768,1813:2324,:)=theImage2; %position image B (eg right of screen)
    else
        imagedouble(1:768,1813:2324,:)=theImage; %position image A (duplicated on right of screen)
    end
   
    
    % rescale the image
    ratio = s2/s1;
    Hpict = rescaleRatio*s1/8;
    Wpict = Hpict*ratio*3.75;
    initRect = [0 0 Wpict Hpict];
    destinationRect = CenterRectOnPoint(initRect, W/2, H/2); %offsets the rect (usable size of screen) to center it around an x and y position
      
    % Make the image into a texture
    imageTexture = Screen('MakeTexture', win, imagedouble); %returns the 2 images in one screen
    
    % Adds the picture to the block.
    pictureBlock = [pictureBlock imageTexture]; 
    
    % Increment the image counter.
    nbPicturesLoaded = nbPicturesLoaded + 1;
    
end

if(nbPicturesLoaded ~= 140) 
    error('Unexpected number of files loaded : %d vs %d expected', nbPicturesLoaded, nbFilesExpected);
end

