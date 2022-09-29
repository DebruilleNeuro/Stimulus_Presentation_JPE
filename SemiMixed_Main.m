function SemiMixed_Main(SubjectID,sequence,rand)

%SubjectID : STRING : Must be a unique string to identify your subject. EX: 'Subject_1'
%sequence : num : choices : 4, 5, 6, 7, 8, 9
%rand : num : 1 or 2

%SCRIPT TO PRESENT THE STIMULI VISAGE TO PARTICIPANTS
%HOW TO LAUNCH 
%In the Command Window: write the name of the function "SemiMixed_Main(SubjectID,sequence,rand) .
%"SubjectID" has to be replaced by the actual code of your participant,
%"sequence" by the number of the sequence you want to show %Sequence of
%images shown (ex sequence, 4 or 5 or 6...)
%"rand" by 1.    %Which randomization sequence will be used to present
%stimuli
%
%Example: SemiMixed_Main('pair1',4,1).

%keyboards settings
KbName('UnifyKeyNames');


diary('log.txt'); %create a verbatim copy of your MATLAB session in a disk file (excluding graphics).
try
    DefaultVariables
    
      %Create OutputResp file 
    OutputResp = fopen(sprintf([SubjectID date '.txt']),'w');
   
    [win1] = Screen('OpenWindow', screenNum); %Initiate the screen window
    
    %Get monitorFlipInterval and write it to OutputResp file.
    [monitorFlipInterval, ~, ~] = Screen('GetFlipInterval', win1, 50, 0.001, 60);
    MFI=monitorFlipInterval*1000; %multiply montior flip interval by 1000 to get milliseconds
    fprintf(OutputResp, '%s\t %u\t %u\n', 'Monitor_Flip_Interval', monitorFlipInterval, MFI); %Send MFI to OutputResp file.
    
    %Set the resolution to 1024x768 @ 85Hz, double check it, load variables
    %with the data from the double check and write it to output file.
    NewRes=Screen('Resolution', screenNum); %Query screen resolution to confirm the change
    Wi=NewRes.width;
    Hi=NewRes.height;
    Z=NewRes.hz;
    
    Screen('TextFont', win1, cfg.FontName); %set font
    Screen('TextSize', win1, cfg.FontSize); %set font size
    Screen('TextStyle', win1, cfg.FontStyle); %set font style
    Screen('TextColor', win1, cfg.FontColour); %set font colour
    
    
    % Calculate_TTL is a separate script. A specific number (trigger) is associated
    % to each experimental condition.
    % Ex: [Resp_2]=Calculate_TTL((2+128)) associates the sum of 128+2
    % (=130) to each image of the condition SAD
    % 1 line = 1 condition.
    % Each trigger and Resp number can only be used once.
    
    [Resp_1]=Calculate_TTL((1+128)); %clear port
    [Resp_2]=Calculate_TTL((2+128)); %SAD
    [Resp_3]=Calculate_TTL((3+128)); %DAD
    [Resp_8]=Calculate_TTL((8+128)); %IN= Image/Noimage
    [Resp_9]=Calculate_TTL((9+128));%NI= Noimage/image

    Send_TTL_Now(Resp_1); %clear port
    ExpStart=GetSecs; %Query time to load GetSec mex
    WaitSecs(0.005); %wait for 5ms to load WaitSecs mex
    %%
     %Write testing session info to text file
    
    %Write Subject ID into OutputResp file
    fprintf(OutputResp, '%s\t %s\n', 'Subject_Number:', SubjectID);
    
    %Write Time and Date to OutputResp file
    fprintf(OutputResp, '%s\t %s\n', 'Date', 'Time');
    fprintf(OutputResp, '%s\t %s\n \n \n \n', datestr(clock, 1), datestr(clock, 13));
    
    %Write Screen Resolution info to output file.
    fprintf(OutputResp, '%s\t %u\n %s\t %u\n %s\t %u\n', 'Res_Width', Wi, 'Res_Height', Hi, 'Hz', Z);
  
    %Insert three carriage returns in OutputResp file.
    fprintf(OutputResp, '\n \n \n');
    %%
    %Section to define sequences of stimuli i.e which folder of pictures
    %will be used for each condition and pair. For example: sequence==4 is the
    %sequence 4. In this sequence the DBD condition will for instance use the folder 
    %A3 and A2 (picture from each folder shown to each participant at the same time). 
    %The SBD condition uses only one folder (e.g A1) because the same image
    % will be presented to both participants, the word 'INUTIL' corresponding to folderToLoadFrom2
    %replaces the path of a second folder.  
    %The arguments in brackets refers to the output created by the function
    %while the part in parentheses is the input needed.
    %For more information about this function go to loadBlockPics_SM
  
    if sequence == 4
        %same images
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A3','INUTIL', 140, win1, cfg.rescaleRatio,samef);
        %different images
        samef=2;
        [DBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A2','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A1', 140, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B1','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4', 70, win1, cfg.rescaleRatio,samef);
        %no image/image
        samef=4;
        [NI,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B2', 70, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 5
       %same images
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A3','INUTIL', 140, win1, cfg.rescaleRatio,samef);
        %different images
        samef=2;
        [DBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A2','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A1', 140, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B1','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4', 70, win1, cfg.rescaleRatio,samef);
        %no image/image
        samef=4;
        [NI,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B2', 70, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 6
      %same images
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A3','INUTIL', 140, win1, cfg.rescaleRatio,samef);
        %different images
        samef=2;
        [DBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A2','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A1', 140, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B1','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4', 70, win1, cfg.rescaleRatio,samef);
        %no image/image
        samef=4;
        [NI,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B2', 70, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 1
       %same images
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A3','INUTIL', 140, win1, cfg.rescaleRatio,samef);
        %different images
        samef=2;
        [DBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A2','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A1', 140, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B1','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4', 70, win1, cfg.rescaleRatio,samef);
        %no image/image
        samef=4;
        [NI,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B2', 70, win1, cfg.rescaleRatio,samef);
        
        
    elseif sequence == 2
          %same images
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A3','INUTIL', 140, win1, cfg.rescaleRatio,samef);
        %different images
        samef=2;
        [DBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A2','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A1', 140, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B1','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4', 70, win1, cfg.rescaleRatio,samef);
        %no image/image
        samef=4;
        [NI,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B2', 70, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 3
       %same images
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A3','INUTIL', 140, win1, cfg.rescaleRatio,samef);
        %different images
        samef=2;
        [DBD,~, destinationRect, files140]  = loadBlockPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A2','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A1', 140, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B1','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4', 70, win1, cfg.rescaleRatio,samef);
        %no image/image
        samef=4;
        [NI,~, destinationRect, files70]  = loadControlPics_SM('/home/presentation/Desktop/SemiMixed Experiment/Stimulus/A4','/home/presentation/Desktop/SemiMixed Experiment/Stimulus/B2', 70, win1, cfg.rescaleRatio,samef);
        
    end
    % Hide mouse cursor:
    HideCursor;

    %Intro are scripts that present instructions to participants 

        Intro1_SM %text: pay attention to instructions
        Intro2_SM %text: relax jaw, light blinking
        Intro3_SM %text: 20min session
        Intro_different %text: announce different pictures
        Intro4_SM %text: experiment will start
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fprintf(OutputResp,'type\tnum\tcondition\n');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %if rand 1, files written in purple will be loaded and located as variables
    %a, b, c, d, e. These file contain numbers used in the script
    %"presentCondition".
    %
    %variable a.conditions: array 1 x 420. Partially randomized list of numbers
    %3,8,9,2 corresponding to the 4 experimental conditions. Each cell = 1
    %trial and the number in cell decides which condition will be used
    % For more information, see script presentCondition_SM
    %
    %Variables b,c,d: used to select the picture indexed by the
    %number written in the cell of the file b,c or d from the folder
    %specified in the sequence. Each cell contains a number corresponding
    %to a file in the folder of images of a given condition, from 1 to 140
    %for SBD, DBD or 1 to 70 for IN,NI, determines the order of presentation 
    %of pictures from folders. The list of numbers determines the order of 
    %presentation of pictures from folders and is randomized
    %everytime the code SemiMixed_Main runs using the randperm function
    %
    %variable x = 1, used to take a cross picture and to show the fixation
    %cross (script showFixationCross_SM)
    
    if rand==1
        a=load('conditions.mat');
        b=load('SBD.mat');
        b.SBD=b.SBD(randperm(length(b.SBD)));
        c=load('DBD.mat');
        c.DBD=c.DBD(randperm(length(c.DBD)));
        d=load('IN.mat');
        d.IN=d.IN(randperm(length(d.IN)));
        e=load('NI.mat');
        e.NI=e.NI(randperm(length(e.NI)));
        x=load('cross.mat')
        
        
    end
    
    %initialize variables used in presentCondition_SM. Used to move up one
    %cell in arrays a,b,c,d at each loop iteration e.g k+1 = cell+1 in b.SBD =
    %different face in folder of faces.
    k=0;
    j=0;
    l=0;
    m=0;
    n=0;
    %Debut de lexperience
    Screen('DrawText',win1,'+',295,445,0,255,[],[]);
    Screen('DrawText',win1,'+',842,445,0,255,[],[]);
    Screen('Flip', win1);
    WaitSecs(1);
    
    for i=1:420 % i corresponds to the number of trials in the experiment. This experiment has 1000 trials
                 %Here 420 trials = 420 loop iterations = scripts presentCondition,
                 %presentFace and showfixationCross used 420 times. 
                 %Reminder: i is the number used to index the cells
                 %in the folder a (so a must have 420 numbers in total).
             
        presentCondition_SM;%this script determine which condition will be presented depending on the number written in the cells of the folder a   
        presentFace_SM;%this script will present the image selected by the program. You normally have nothing to change in this script except if your participants have to provide an answer by pressing a key
        showFixationCross_SM;
        %showFixationCross;%this script shows the fixation cross
       

    end
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Script to end experiment and close the screen.
    EndExperiment
    
catch
    Screen('CloseAll');
    rethrow(lasterror);
end

