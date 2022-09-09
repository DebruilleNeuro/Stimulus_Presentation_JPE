%% Intro1
axis_xg = 24;
axis_xd = 600;
%pour texte a gauche
Screen('DrawText',win1,'Try to remember the next 200 faces. In this session,',axis_xg,200,0,255,[],[]);
Screen('DrawText',win1,'your partner will always be seeing DIFFERENT faces',axis_xg,230,0,255,[],[]);
Screen('DrawText',win1,'at the same time. Press the space bar only once to continue.',axis_xg,290,0,255,[],[]);

%pour teste a droiteScreen
Screen('DrawText',win1,'Try to remember the next 200 faces. In this session,',axis_xd,200,0,255,[],[]);
Screen('DrawText',win1,'your partner will always be seeing DIFFERENT faces',axis_xd,230,0,255,[],[]);
Screen('DrawText',win1,'at the same time. Press the space bar only once to continue.',axis_xd,290,0,255,[],[]);

%afficher le texte
Screen('Flip', win1);

waitForKeyPress();