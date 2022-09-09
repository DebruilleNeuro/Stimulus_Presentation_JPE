%% Intro208
axis_xg = 24;
axis_xd = 600;
%pour texte a gauche
Screen('DrawText',win1,'The experiment will now start.',axis_xg,200,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to begin.',axis_xg,260,0,255,[],[]);

%pour teste a droiteScreen
Screen('DrawText',win1,'The experiment will now start.',axis_xd,200,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to begin.',axis_xd,260,0,255,[],[]);



%afficher le texte
Screen('Flip', win1);

waitForKeyPress();