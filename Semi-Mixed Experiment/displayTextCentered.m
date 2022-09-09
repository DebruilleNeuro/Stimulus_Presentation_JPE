function displayTextCentered(window, textToDisplay, screenColor, textColor, lineSpacing, textSize, X, Y)
	Screen(window,'FillRect', screenColor);
	[nx, ny, textbounds] = DrawFormattedText(window, textToDisplay, X, Y, textColor, textSize, [], [], lineSpacing, [], []);
	Screen('Flip', window);
end