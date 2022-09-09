function VisageMixFlorence(SubjectID,sequence,intro,rand)

%SubjectID : STRING : Must be a unique string to identify your subject. EX: 'Subject_1'
%sequence : num : choices : 4, 5, 6, 7, 8,9
%intro : num :  
%rand : num : 1 or 2
%l experience
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
    
    
    % Calculates all TTL signals
    [Resp_1]=Calculate_TTL((1+128)); %clear port
    [Resp_2]=Calculate_TTL((2+128)); %SBS
    [Resp_3]=Calculate_TTL((3+128)); %DBS
    [Resp_4]=Calculate_TTL((4+128)); %reponse 1 suject 1
    [Resp_5]=Calculate_TTL((5+128)); %reponse 2 suject 1
    [Resp_6]=Calculate_TTL((6+128)); %reponse 1 suject 2
    [Resp_7]=Calculate_TTL((7+128)); %reponse 2 suject 2
 
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
    %laod picture and build/home/presentation/Desktop/Crazy/Visage picture
    %[Pictures1,~, destinationRect]  = LoadPicturesFromBlock('/home/presentation/Desktop/tomv2/S3/','INUTIL', 200, win1, cfg.rescaleRatio,samef);
    if sequence == 4
        %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M3','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M1','/home/presentation/Desktop/Crazy/Visage/M2', 100, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 5
        %same alone
        samef=1; %need to change path
        [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M2','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M1','/home/presentation/Desktop/Crazy/Visage/M3', 100, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 6
        %same alone
        samef=1;
        [SBS,~, destinationRecesp_t,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M1','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M2','/home/presentation/Desktop/Crazy/Visage/M3', 100, win1, cfg.rescaleRatio,samef);
        
        
    elseif sequence == 1
        %same
        samef=1; %will have to change path of these folders on presentation computer
        [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M3','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        %different
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M2','/home/presentation/Desktop/Crazy/Visage/M1', 100, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 2
        %same alone
        samef=1; %need to change path
        [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M2','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M3','/home/presentation/Desktop/Crazy/Visage/M1', 100, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 3
        %same alone
        samef=1;
        [SBS,~, destinationRecesp_t,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M1','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/M3','/home/presentation/Desktop/Crazy/Visage/M2', 100, win1, cfg.rescaleRatio,samef);
        
    
    
    
    
    
    
    
    elseif sequence == 7
        %same alone
        samef=1;
        [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/03 A.SBs.V 100/','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/06 A.DBs.V S1/','/home/presentation/Desktop/Crazy/Visage/07 A.DBs.V S2/', 100, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 8
        %same alone
        samef=1;
        [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/07 A.DBs.V S2/','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/03 A.SBs.V 100/','/home/presentation/Desktop/Crazy/Visage/06 A.DBs.V S1/', 100, win1, cfg.rescaleRatio,samef);
        
    elseif sequence == 9
        %same alone
        samef=1;
        [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/06 A.DBs.V S1/','INUTIL', 100, win1, cfg.rescaleRatio,samef);
        samef=2;
        [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/07 A.DBs.V S2/','/home/presentation/Desktop/Crazy/Visage/03 A.SBs.V 100/', 100, win1, cfg.rescaleRatio,samef);

        
        
        
        
        %     elseif sequence == 040201
%         %same
%         samef=1;
%         [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/04 WUC.SBs.V','INUTIL', 100, win1, cfg.rescaleRatio,samef);
%         %different
%         samef=2;
%         [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/02 WCO.DBs.V S2 100/','/home/presentation/Desktop/Crazy/Visage/01 WCO.DBs.V S1 100/', 100, win1, cfg.rescaleRatio,samef);
%    elseif sequence == 050706
%         %same alone
%         samef=1;
%         [SBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/05 A.V','INUTIL', 100, win1, cfg.rescaleRatio,samef);
%         samef=2;
%         [DBS,~, destinationRect,fileNum]  = LoadPicturesFromBlock('/home/presentation/Desktop/Crazy/Visage/07 A.DBs.V S2/','/home/presentation/Desktop/Crazy/Visage/06 A.DBs.V S1/', 100, win1, cfg.rescaleRatio,samef); 
     end
    % Hide mouse cursor:
    HideCursor;

    if intro == 1

        Intro201
        %Intro202
        Intro203
        Intro204
        %Intro205
        Intro206fsame
        %Intro207
        Intro208
        


    elseif intro==3
        Intro14
    end
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fprintf(OutputResp,'type\tnum\tcondition\n');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %ordre aleatoire des image
    if rand==1
        a=load('a1.mat');
        b=load('b1.mat');
        c=load('c1.mat');
    elseif rand==2
        a=load('a2.mat');
        b=load('b2.mat');
        c=load('c2.mat');
    end
    k=0;
    j=0;
    %Debut de lexperience
    Screen('DrawText',win1,'+',295,445,0,255,[],[]);
    Screen('DrawText',win1,'+',842,445,0,255,[],[]);
    Screen('Flip', win1);
    WaitSecs(1);
    
    for i=1:200

        VisageCEf;      
        PresentImage;
        showFixationCross;
       

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
