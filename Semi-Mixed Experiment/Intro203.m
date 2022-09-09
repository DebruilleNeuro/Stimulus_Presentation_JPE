%% Intro1
axis_xg = 24;
axis_xd = 600;
%pour texte a gauche
Screen('DrawText',win1,'It is very important that you continue to',axis_xg,200,0,255,[],[]);
Screen('DrawText',win1,'stay relaxed and that you move as little as possible.',axis_xg,230,0,255,[],[]);
Screen('DrawText',win1,'Blink LIGHTLY and as little as possible. ',axis_xg,290,0,255,[],[]);
Screen('DrawText',win1,'Do not frown or tighten your jaw. This is very',axis_xg,320,0,255,[],[]);
Screen('DrawText',win1,'important for us since any blinking, muscle contraction,',axis_xg,350,0,255,[],[]);
Screen('DrawText',win1,'or other movement will affect your brain’s recording.',axis_xg,380,0,255,[],[]);
Screen('DrawText',win1,'',axis_xg,410,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to continue.',axis_xg,440,0,255,[],[]);

%pour teste a droiteScreen
Screen('DrawText',win1,'It is very important that you continue to',axis_xd,200,0,255,[],[]);
Screen('DrawText',win1,'stay relaxed and that you move as little as possible.',axis_xd,230,0,255,[],[]);
Screen('DrawText',win1,'Blink LIGHTLY and as little as possible. ',axis_xd,290,0,255,[],[]);
Screen('DrawText',win1,'Do not frown or tighten your jaw. This is very',axis_xd,320,0,255,[],[]);
Screen('DrawText',win1,'important for us since any blinking, muscle contraction,',axis_xd,350,0,255,[],[]);
Screen('DrawText',win1,'or other movement will affect your brain’s recording.',axis_xd,380,0,255,[],[]);
Screen('DrawText',win1,'',axis_xd,410,0,255,[],[]);
Screen('DrawText',win1,'Press the space bar only once to continue.',axis_xd,440,0,255,[],[]);

%afficher le texte
Screen('Flip', win1);

waitForKeyPress();
