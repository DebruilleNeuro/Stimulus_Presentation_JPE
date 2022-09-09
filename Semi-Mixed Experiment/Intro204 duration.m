%% Intro1
axis_xg = 24;
axis_xd = 600;
%pour texte a gauche
Screen('DrawText',win1,'This session will last about 30 minutes. You will',axis_xg,200,0,255,[],[]);
Screen('DrawText',win1,'have a few short breaks during',axis_xg,230,0,255,[],[]);
Screen('DrawText',win1,'which you can readjust yourself and blink as much as',axis_xg,260,0,255,[],[]);
Screen('DrawText',win1,'you want. Press the space bar only once when you are ready',axis_xg,290,0,255,[],[]);
Screen('DrawText',win1,'to begin.',axis_xg,320,0,255,[],[]);


%pour texte a droite
Screen('DrawText',win1,'This session will last about 30 minutes. You will',axis_xd,200,0,255,[],[]);
Screen('DrawText',win1,'have a few short breaks during',axis_xd,230,0,255,[],[]);
Screen('DrawText',win1,'which you can readjust yourself and blink as much as',axis_xd,260,0,255,[],[]);
Screen('DrawText',win1,'you want. Press the space bar only once when you are ready ',axis_xd,290,0,255,[],[]);
Screen('DrawText',win1,'to begin.',axis_xd,320,0,255,[],[]);

%afficher le texte
Screen('Flip', win1);

waitForKeyPress();