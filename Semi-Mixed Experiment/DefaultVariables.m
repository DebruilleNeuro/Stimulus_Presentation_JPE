%% DefaultVariables

%Screen perameteres
cfg.Screen_Colour=[255,255,255]; %color is a 1x3 color vector - [r g b] with color range from 0:255
cfg.Scr_Rez_X=1024;
cfg.Scr_Rez_Y=768;
cfg.Scr_Hz=85;

%font perameteres
cfg.FontSize=20;%Define font size to 40
cfg.FontStyle=1; %Define font style to normal (0=normal,1=bold,2=italic,4=underline,8=outline,32=condense,64=extend)
cfg.FontColour=[0,0,0]; %color is a 1x3 color vector - [r g b] with color range from 0:255
cfg.BlinkFontColour=[255,0,0]; %color is a 1x3 color vector - [r g b] with color range from 0:255
% cfg.FontName='-bitstream-courier 10 pitch-bold-i-normal--0-0-0-0-m-0-iso8859-1'; %Define font to use
% cfg.FontName='-bitstream-courier 10 pitch-bold-r-normal--17-120-100-100-n-0-iso8859-1'
cfg.FontName='Times';
cfg.FixCrossSize=20; %Define size of fixation cross
cfg.LineSpacing=1.5;

%Number of the screen we are working on.
screenNum=0; %If only one screen is connected its number will be 0


%Text for instruction screens

cfg.Intro1_Text='The experiment is separated into 9 blocks of 5 minutes and will last for approximately 45 minutes in total. You are free to refuse to continue participating at any time without being asked for a reason and without any negative consequences. Please press any key to continue.'
cfg.Intro2_Text='In each of the 9 blocks, sentences will be presented in two parts: first you will see the sentence frame which will end in a fixation cross, and then the sentence ending word will replace the fixation cross. You will have to read the sentence frame, and then focus your eyes on the fixation cross in order to avoid eye movement. After the sentence, another fixation cross will appear on the screen. Your gaze should remain there in between sentences. It is important to stay relaxed and still throughout the experiment. Please avoid any head, eye, facial muscle, or body movement. This pertains most importantly to blinking. Please try to blink ONLY when you are asked to. This will occur approximately every 2 sentences. Please use this time to blink, swallow your saliva, or move any body parts as needed.'
cfg.Intro3_Text='BLOCK 1: Please visualize the contents described by each sentence. Please press "1" if the sentence makes a lot of sense to you, or "2" if the sentence makes little sense to you. Please answer as FAST and ACCURATELY as possible.' 
cfg.Intro5_Text='BLOCK 2: For each trial in this block you will see an incomplete sentence frame. Please read aloud the sentence frame, and complete the sentence with an ending of your choice.The frames will only be shown for a short amount of time. Remember to blink ONLY when instructed to do so.' 


%Trial perameteres
cfg.BlinkTrial=8; %Set how many trial itterations before blink screen appears
cfg.First_Fix_Dur=80; %80ms

cfg.BlinkText='BLINK!'; %Set what text is displayed in blink screen
cfg.Blink_Dur=50; %Set duration of Blink Screen

cfg.Blink_Fix_Dur_min=790;
cfg.Blink_Fix_Dur_max=1500; %Set duration of fixation following Blink Screen

cfg.String_Dur=1500; %Indicate target duration of sentence in milliseconds
cfg.End_Word_Dur=1000; %Indicate target duration of end word in milliseconds

cfg.ClearTimeDurRange=2640; %list of durations for the post stimulus fixation cross

cfg.rescaleRatio = 3;
