%% EndExperiment

%Ends experiment, and closes OutputResp file and screen window.

%Fill screen with Screen_Colour and write 'Thank You' in TextColour for 100 refreshes. 

for i = 1:100
	displayTextCentered(win1, 'Merci! \n \n \n Thank You!', cfg.Screen_Colour, cfg.FontColour, cfg.LineSpacing, 50, 'center', 'center'); 
end


% close 'OutputResp.txt' file.
fclose(OutputResp);

% Show mouse cursor:
ShowCursor;

% Return to original screen resolution
%OldRes=SetResolution(screenNum,OldRes.width,OldRes.height,OldRes.hz,[]);

%Close screen window.
Screen('CloseAll');
return;