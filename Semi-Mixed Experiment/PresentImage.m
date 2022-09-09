%%Prime
% set realtime priority for program
priorityLevel=MaxPriority(win1);
Priority(priorityLevel);



% Draw the image to the screen, unless otherwise specified PTB will draw
% the texture full size in the center of the screen. We first draw the
% image in its correct orientation.
Screen('FillRect', win1, cfg.Screen_Colour);
Screen('DrawTexture', win1, imageTextureToShow, [], destinationRect, 0);
[~, onset]=Screen('Flip', win1);
%send the trigger
Send_TTL_Now(resp);
time=GetSecs-ExpStart;
out= [num2str(time) '\t' num2str(image_nb) '\t' num2str(trigger) '\n'];
fprintf(OutputResp,out);

r=0;
f=0;
[keyIsDown, secs, keyCode] = KbCheck;
start=GetSecs;
while(1)
    
    [keyIsDown, secs, keyCode] = KbCheck;
    
    if keyCode(88)+keyCode(89)+keyCode(53)+keyCode(54)~=0
        if r==0
            if keyCode(88)==1 % 1
                Send_TTL_Now(Resp_4); % reponse 1 sujet fait beaucoup de sense   sujet
                r=r+1;
                time=GetSecs-ExpStart;
                out= [num2str(time) '\t' num2str(image_nb) '\t' num2str(sequence) '\t4\n'];
                fprintf(OutputResp,out);
            end
            if keyCode(89)==1 % 2
                Send_TTL_Now(Resp_5); % reponse 2 sujet fait un peu de sense  sujet
                r=r+1;
                out= [num2str(time) '\t' num2str(image_nb) '\t' num2str(sequence) '\t5\n'];
                fprintf(OutputResp,out);
            end
        end
        if f==0
            if keyCode(53)==1 % z
                Send_TTL_Now(Resp_6); % reponse 2 sujet fait pas de sense  sujet
                f=f+1;
                out= [num2str(time) '\t' num2str(image_nb) '\t' num2str(sequence) '\t6\n'];
                fprintf(OutputResp,out);
            end
            if keyCode(54)==1 % x
                Send_TTL_Now(Resp_7); % reponse 2 sujet fait pas de sense  sujet
                f=f+1;
                out= [num2str(time) '\t' num2str(image_nb) '\t' num2str(sequence) '\t7\n'];
                fprintf(OutputResp,out);
            end
        end
    end
    answer=GetSecs;
    
    if answer-start >= 1
        break
    end
end



%Screen('FillRect', win1, cfg.Screen_Colour);
 %showFixationCross(win1, cfg.Screen_Colour, cfg.FontColour,'center', 'center');
%DrawFormattedText(win1, '++', 'center', 'center', cfg.FontColour, cfg.FontSize, [], [], cfg.LineSpacing, [], []);


Priority(0);