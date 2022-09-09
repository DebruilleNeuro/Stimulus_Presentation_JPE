function VisageMix2021(SubjectID,sequence,intro,rand)

%FINAL VERSION 
%SubjectID : STRING : Must be a unique string to identify your subject. EX: 'Subject_1'
%sequence : num : choices : 4, 5, 6, 7, 8, 9
%intro : num :  
%rand : num : 1 or 2
%l experience

%You have to write the name of the function which is written next to the
%word "function", that is to say
%"VisageMix2021(SubjectID,sequence,intro,rand) to launch the program.
%you have to replace "SubjectID" by the actual code of your participant,
%replace "sequence" by the number of the sequence you want to show to your
%participants, "intro" by 1, "rand" by 1.
%For exemple, to launch the program to present the stimuli to the pair 1 I
%would writte VisageMix2021('pair1',4,1,1).
%Here I use the sequence 4 but it could other sequences, this depends on
%the table of presentation of sequence you've made beforehand that you had
%shown to Bruno for his approval.


%key baords settings
KbName('UnifyKeyNames');


diary('log.txt'); %create a verbatim copy of your MATLAB session in a disk file (excluding graphics).
try
    DefaultVariables
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Create OutputResp file ap    crazy effect et aronpending the Subject ID, the date to the title.
    OutputResp = fopen(sprintf(['Visagetest' SubjectID date '.txt']),'w');
    
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
    
    
    % Calculate_TTL is another script. It associates a specific number (that we call trigger) for
    % each condition which is written in comment next to the line below.
    % Exemple: [Resp_2]=Calculate_TTL((2+128)) associates the sum of 128+2
    % so 130 to each image of the condition SAD. If you add a condition,
    % you will have to add another line (ex:
    % [Resp_11]=Calculate_TTL((11+128)), 139 will be the specific trigger
    % associated to this new condition. You have to make sure that you
    % don't use two times the same number for a trigger neither the number
    % for the Resp. For instance, you can only have one [Resp_1]
    
    [Resp_1]=Calculate_TTL((1+128)); %clear port
    [Resp_2]=Calculate_TTL((2+128)); %SAD
    [Resp_3]=Calculate_TTL((3+128)); %DAD
    [Resp_8]=Calculate_TTL((8+128)); %IN= Image/Noimage
    [Resp_9]=Calculate_TTL((9+128));%NI= Noimage/image
    [Resp_10]=Calculate_TTL((10+128)); %NN= Noimage/Noimage
   
 
    %intro : num : 1=montrer le text d introduction pour crazy effect et aron, 2 = texte d introduction pour closeness, autre = debut directe de
%l experience
    Send_TTL_Now(Resp_1); %clear port
    ExpStart=GetSecs; %Query time to load GetSec mex
    WaitSecs(0.005); %wait for 5ms to load WaitSecs mex
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Write Subject ID into OutputResp file
    fprintf(OutputResp, '%s\t %s\n', 'Subject_Number:', SubjectID);
    
    %Write Time and Date to OutputResp file
    fprintf(OutputResp, '%s\t %s\n', 'Date', 'Time');
    fprintf(OutputResp, '%s\t %s\n \n \n \n', datestr(clock, 1), datestr(clock, 13));
    
    %Write Screen Resolution info to output file.
    fprintf(OutputResp, '%s\t %u\n %s\t %u\n %s\t %u\n', 'Res_Width', Wi, 'Res_Height', Hi, 'Hz', Z);
    
    %Insert three carriage returns in OutputResp file.
    fprintf(OutputResp, '\n \n \n');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Here is the part where you define the sequences. In other words, it is
    %where you will define which folder of stimuli will be used for one
    %condition and for each sequence. For example: sequence==4 is the
    %sequence 4. In this sequence the SBD condition uses the folder F8
    %which is located in this particular patch
    %'/home/presentation/Desktop/matlab mixed visage code/Visage/F8'. The
    %path needs to be written as you can see below. Importantely, the word 'INUTIL'
    % written next to it is replacing the path of a second folder. In
    % effect, since the SBD condition consists to present the same image to
    % both participants, then only one image from the folder F8 needs to be
    % used. In contrast, The DBD condition uses the folders F7 and F6. The
    % path of both folders appears. The DBD condition consists in showing 2
    % different images, one to each participant. Hence one image from the
    % folder F6 will be shown and another image from the folder F7 will be
    % shown to the second participant.
    %The part in brackets like [SBD,~, destinationRect,fileNum] corresponds
    %to the variables that will be created by LoadPicturesFromBlock2021()
    %which is another script. Hence, if you add a condition, you will have
    %to add a new line "[SBD,~, destinationRect,fileNum]  =
    %LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F8','INUTIL', 200, win1, cfg.rescaleRatio,samef);"
    % but by changing "SBD" by the name of your new condition.
    % In addition, you will need to add a line "samef==5" you can use 5 or
    % any other number which is not already used. samef is a variable which
    % tells to the script loadpicturefromblock2021()which condition is
    % being used. This way, it will take a stimulus from the folders which
    % are written in loadpicturefromblock2021()on the line below.
    %For example, if I want to add a new condition in which 2 different
    %images will be presented to the two participants.For example for a condition named
    %"doubledimage", I will add the following
    %if sequence==10
    %samef=6;
        %[doubleimage,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F6','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
   %Don't forget that the folders used are made beforehand. In other
   %words, you will have to create the folders in which you will locate 
   %the stimulus you want to use for one specific condition. All the
   %information written in between the paranthesis of
   %LoadPicturesFromBlock2021() are the inputs of the script LoadPicturesFromBlock2021()
   %You will need to change the path of the folders in which the stimuli
   %are located and the number "200". This number corresponds to the number
   %of stimuli in the folders. If you have more or less that this number
   %you will get an error from matlab. This number corresponds to the
   %number of trials used of a specific condition. In this experiment, we
   %use 200 trials for each condition, hence 200 images are located in each
   %folder of stimuli. And the number written between the parenthesis is
   %"200".
   %As you can see on the code below, each condition is defined in each
   %sequence. The purpose of this manipulation is to make sure that each
   %folder of stimuli is used for every condition. In other words, one pair
   %of participant will see the sequence 4, meaning that the images of the
   %condition F8 will be presented simultaneously to both participants
   %(SBD) and one image from the folder F6 will be presented to one participant and another one from the folder F7 
   %will be presented to the other.
    if sequence == 4
        %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F8','INUTIL', 200, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F7','/home/presentation/Desktop/matlab mixed visage code/Visage/F6', 200, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F6','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
        %no image/image 
        samef=4;
        [NI,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F7', 200, win1, cfg.rescaleRatio,samef);
        %no image/no image
        samef=5;
        [NN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
    
    
    elseif sequence == 5
        %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F7','INUTIL', 200, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F6','/home/presentation/Desktop/matlab mixed visage code/Visage/F8', 200, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F8','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
        %no image/image 
        samef=4;
        [NI,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F6', 200, win1, cfg.rescaleRatio,samef);
        %no image/no image
        samef=5;
        [NN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
    elseif sequence == 6
       %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F6','INUTIL', 200, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F8','/home/presentation/Desktop/matlab mixed visage code/Visage/F7', 200, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F7','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
        %no image/image 
        samef=4;
        [NI,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F8', 200, win1, cfg.rescaleRatio,samef);
        %no image/no image
        samef=5;
        [NN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 1
        %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F8','INUTIL', 200, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F6','/home/presentation/Desktop/matlab mixed visage code/Visage/F7', 200, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F7','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
        %no image/image 
        samef=4;
        [NI,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F6', 200, win1, cfg.rescaleRatio,samef);
        %no image/no image
        samef=5;
        [NN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
    elseif sequence == 2
        %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F7','INUTIL', 200, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F8','/home/presentation/Desktop/matlab mixed visage code/Visage/F6', 200, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F6','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
        %no image/image 
        samef=4;
        [NI,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F8', 200, win1, cfg.rescaleRatio,samef);
        %no image/no image
        samef=5;
        [NN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
    elseif sequence == 3
        %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F6','INUTIL', 200, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBD,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F7','/home/presentation/Desktop/matlab mixed visage code/Visage/F8', 200, win1, cfg.rescaleRatio,samef);
        %image/no image
        samef=3;
        [IN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F8','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
        %no image/image 
        samef=4;
        [NI,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F7', 200, win1, cfg.rescaleRatio,samef);
        %no image/no image
        samef=5;
        [NN,~, destinationRect,fileNum]  = LoadPicturesFromBlock2021('/home/presentation/Desktop/matlab mixed visage code/Visage/F5','/home/presentation/Desktop/matlab mixed visage code/Visage/F5', 200, win1, cfg.rescaleRatio,samef);
     end
    % Hide mouse cursor:
    HideCursor;

    %Intro are scripts in which the text of the introduction is already
    %written. This text corresponds to the instrcutions, tasks and
    %information which are provided on the screen of each participant. You
    %will need to modify these scripts directly to change the text
    %depending on what is the task which is asked to the participants and
    %what are the informations which are provided.
    %Here if you have written 1 as an input when typing the name of the
    %function which is VisageMix2021( SubjectID,sequence,intro,rand), then
    %the program will show the Intro201, then intro203, then intro204 and
    %so on and so forth
    if intro == 1

        Intro201
        %Intro202
        Intro203
        Intro204
        %Intro205
        Intro206fsame
        %Intro207
        Intro208
       
    end
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fprintf(OutputResp,'type\tnum\tcondition\n');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %rand is another input that you had to type when typing the name of the
    %function which is VisageMix2021( SubjectID,sequence,intro,rand). if
    %you have written 1 for rand then the program loads the files
    %a1_2021.mat, b1_2021.mat, c1_2021.mat, d1_2021.mat. The names of these files
    %will be located as variables a, b, c and d respectively. Therefore the
    %file a1_2021.mat contains numbers which will be used in the script
    %"VisageCE2021" further below. The numbers written in this file will allow the program to
    %know when a specific condition will be presented to participants. For
    %example if you open the file a1_2021.mat, then you will see the number
    %1000 first. If you open the script "VisageCE2021" you will see line 21
    %"elseif a.a(i)==1000". This means that if the number in the cell
    %number 'i' is equal to 1000 then the images which will be shown will
    %correspond to the condition IN that is to say the condition image no
    %image. This is written in the code VisageCE2021 line 23 on which is written 
    %imageTextureToShow = IN(d.d.a(l));
    %image_nb=fileNum(d.d.a(l));
    %The files b,c, and d are used to select the picture indexed by the
    %number written in the cell of the file b,c or d from the folder
    %specified in the sequence.
    %For exemple: if you open the file b, you will see the number X in the
    %first cell. Now if you go to the script VisageCE2021 line 11, you will
    %see that the fold b is used for the condition SBD.
    %the line "if mod(a.a(i),2)==0 && a.a(i)<1000;" means that if the remaining of the division
    % by two of the number in the cell i of the folder a is 0 and that the
    % number is inferior to 1000 then the program will pick the picture
    % number k in the folder associated to the condition SBD
    %"k=k+1;
    %imageTextureToShow = SBD(b.a(k));
    %image_nb=fileNum(b.a(k));
    %resp=Resp_2;
    %trigger=2;"
    %
    if rand==1
        a=load('a1_2021.mat');
        a.a=a.a(randperm(length(a.a)));
        b=load('b1_2021.mat');
        b.a=b.a(randperm(length(b.a)));
        c=load('c1_2021.mat');
        c.a=c.a(randperm(length(c.a)));
        d=load('d1_2021.mat');
        d.d=d.d(randperm(length(d.d)));
        
    end
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
    
    
    for i=1:1000 %here i corresponds to the number of trials in the experiment. This experiment has 1000 trials
                 %therefore, it will use the scripts VisageCE2021,
                 %presentimage2021 and showficationCross 1000 times. I
                 %remind you that i is the number used to index the cells
                 %in the folder a (so a must have 1000 numbers in total). I
                 %also remind you that it is the numbers in this folders
                 %which determine what conditions will be shown using the
                 %script VisageCE2021
                

        visageCE2021;%this script determine which condition will be presented depending on the number written in the cells of the folder a   
        presentimage2021;%this script will present the image selected by the program. You normally have nothing to change in this script except if your participants have to provide an answer by pressing a key
        crossfixation2021;
        %showFixationCross;%this script shows the fixation cross
       

    end
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Script to end experiment and close the screen.
    EndExperiment
    
catch
    Screen('CloseAll');
    rethrow(lasterror);
end
%information a demander
%temps que reste l image  1s
%temps que reste la coirx  1.5 a 2.5
% frenquence des blink 
% temps des blink 1s
%temps de la croix apres le blink 1.5 a 2.5
% es ce qu il y une question si oui la quel et combiend e reponse

%faire un reglage sur les ecran de pressentation
