%% Intro1
axis_xg = 24;
axis_xd = 600;
%pour texte a gauche
Screen('DrawText',win1,'The following instructions involve several screens.',axis_xg,200,0,255,[],[]);
Screen('DrawText',win1,'Make sure you have fully understood the content',axis_xg,230,0,255,[],[]);
Screen('DrawText',win1,'of each screen before going to the next,',axis_xg,260,0,255,[],[]);
Screen('DrawText',win1,'because you will not be able to go back.',axis_xg,290,0,255,[],[]);
Screen('DrawText',win1,' ',axis_xg,320,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to continue.',axis_xg,350,0,255,[],[]);

                                    
%pour teste a droiteScreen
Screen('DrawText',win1,'The following instructions involve several screens.',axis_xd,200,0,255,[],[]);
Screen('DrawText',win1,'Make sure you have fully understood the content',axis_xd,230,0,255,[],[]);
Screen('DrawText',win1,'of each screen before going to the next,',axis_xd,260,0,255,[],[]);
Screen('DrawText',win1,'because you will not be able to go back.',axis_xd,290,0,255,[],[]);
Screen('DrawText',win1,' ',axis_xg,320,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to continue.',axis_xd,350,0,255,[],[]);

%afficher le texte
Screen('Flip', win1);

waitForKeyPress();
