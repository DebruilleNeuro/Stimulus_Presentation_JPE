%% Intro1
axis_xg = 24;
axis_xd = 600;
%pour texte a gauche
Screen('DrawText',win1,'You are in a pause. Feel free to move but be careful as',axis_xg,200,0,255,[],[]);
Screen('DrawText',win1,'it should not have an impact on the electrode cap. You',axis_xg,230,0,255,[],[]);
Screen('DrawText',win1,'may now blink as much as you want. We will tell you',axis_xg,260,0,255,[],[]);
Screen('DrawText',win1,'when the pause is over.',axis_xg,290,0,255,[],[]);

                  
%pour teste a droiteScreen
Screen('DrawText',win1,'You are in a pause. Feel free to move but be careful as',axis_xd,200,0,255,[],[]);
Screen('DrawText',win1,'it should not have an impact on the electrode cap. You',axis_xd,230,0,255,[],[]);
Screen('DrawText',win1,'may now blink as much as you want. We will tell you',axis_xd,260,0,255,[],[]);
Screen('DrawText',win1,'when the pause is over.',axis_xd,290,0,255,[],[]);

%afficher le texte
Screen('Flip', win1);

waitForKeyPress();
