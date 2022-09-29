%This script presents the fixation cross in between trials. The image of
%the cross is the same as used for the trials "no image"

Cross = []; %initializing variable
file = []; %initializing variable
imagedouble=ones(768,2324,3)*255; %sets resolution of pictures
win= win1; %returns parameters of the screen set in Main script
rescaleRatio=cfg.rescaleRatio; %returns display parameters

folderToLoadFrom = '/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4' %folder to load cross from

folderToLoadFrom = fullfile(folderToLoadFrom); %fullfile builds a full file specification from the specified folder and file names

[W, H] = Screen('WindowSize', win); %Returns the width and height of the window or screen in units of pixels

listing = dir([folderToLoadFrom,'/*.bmp']); %dir lists folder contents (here listing will return list of bmp files in folderToLoadFrom
[nbFiles, ~] = size(listing); %size gives number of files in folder

%Same loop as in functions that load pictures of stimuli (e.g loadBlockpics_SM.m). Used for
%simplicity, not for optimization.
for idx = 1 %one iteration because 1 picture to load

    % Gets a filename from the full listing.
    fileName = listing(idx).name; 
    
    % Get the number from the file name.  Considering the filename format {number}.bmp:
    % get '.' position
    dotPos = strfind(fileName, '.');
    dotPos = dotPos(1);
    file(idx) = str2num(fileName(4 : dotPos - 1));
    
    % Concatenate path with name
    filePath = fullfile(folderToLoadFrom, fileName);
    
    % Reads the file
    theCross = imread(filePath);

    % Get the size of the image
    [s1, s2, s3] = size(theCross);
    
    imagedouble(1:768,1:512,:) = theCross; 
   
    imagedouble(1:768,1813:2324,:)=theCross;
     
    % rescale the image
    ratio = s2/s1;
    Hpict = rescaleRatio*s1/8;
    Wpict = Hpict*ratio*3.75;
    initRect = [0 0 Wpict Hpict];
    destinationRect = CenterRectOnPoint(initRect, W/2, H/2);
        
    % Make the image into a texture
    imageTexture = Screen('MakeTexture', win, imagedouble);
    
    % Add the picture to the block.
    Cross = [Cross imageTexture];
end

%Cross

crossimage= Cross(x.cross(1)); %chooses picture position in  (one choice)
Screen('FillRect', win1, cfg.Screen_Colour); %screen parameters
Screen('DrawTexture', win1, crossimage, [], destinationRect, 0); %display parameters
Screen('Flip', win1); %Flip front and back display surfaces in sync with vertical retrace



    s=(200+rand(1)*1000)/1000 %display time

WaitSecs(s)

