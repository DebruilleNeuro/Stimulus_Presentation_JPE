%% Intro1
axis_xg = 24;
axis_xd = 600;
%pour texte a gauche
Screen('DrawText',win1,'The experiment will now start.',axis_xg,200,0,255,[],[]);
Screen('DrawText',win1,'As in the first part, you will see different images',axis_xg,230,0,255,[],[]);
Screen('DrawText',win1,'than your partner.',axis_xg,260,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to continue.',axis_xg,290,0,255,[],[]);

%pour teste a droiteScreen
Screen('DrawText',win1,'The experiment will now start.',axis_xd,200,0,255,[],[]);
Screen('DrawText',win1,'As in the first part, you will see different images',axis_xd,230,0,255,[],[]);
Screen('DrawText',win1,'than your partner.',axis_xd,260,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to continue.',axis_xd,290,0,255,[],[]);



%afficher le texte
Screen('Flip', win1);

waitForKeyPress();
