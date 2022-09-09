function waitForKeyPress()

	key =0;

	while(key ~=2 )
		 % Check the keyboard to see if a button has been pressed
	    [keyWasPressed,secs, keyCode] = KbCheck;
        key = key+keyWasPressed;
        if keyWasPressed==1
            WaitSecs(0.2);
        end
    end

    WaitSecs(0.3);
    
end
