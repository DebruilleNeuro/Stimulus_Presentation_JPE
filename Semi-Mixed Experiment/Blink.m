%%Blink

Screen('DrawText',win1,' ',250,420,[255,0,0],255,[],[]);
Screen('Flip', win1);
x=(1000+rand(1)*700)/1000
WaitSecs(x);

Screen('DrawText',win1,'BLINK!',250,420,[255,0,0],255,[],[]);
Screen('DrawText',win1,'BLINK!',865,420,[255,0,0],255,[],[]);
Screen('Flip', win1);
WaitSecs(0.5);

Screen('DrawText',win1,' ',250,420,[255,0,0],255,[],[]);
Screen('Flip', win1);

WaitSecs(1.3);



