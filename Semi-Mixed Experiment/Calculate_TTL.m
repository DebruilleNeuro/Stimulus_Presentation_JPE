function [numberArray]=Calculate_TTL(numberToSend)

    % Checks that the number is valid.
    
    if numberToSend > 255 || numberToSend < 0
        error('Number to send is invalid: larger than 255 or smaller than 0.')
    end
    
    % Creates the array that will be sent to the acquisition computer.
    
    numberArray = false(1,8);
    
    % We use 'i' to know which position we are visiting.
    
    i = 1;
    
    % Iterate over all elements of array, setting the 
    %value either to true or false.
    
    while i <= 8;
    
        % We calculate the power of two of the current position.
        
        currentPowerOfTwo = 2^(8 - i);     
        
        % If the number is greater or equal to the power of two,
        % substract that number and set position to true. Otherwise,
        % set position to false.
        
        if numberToSend >= currentPowerOfTwo
        
            numberToSend = numberToSend - currentPowerOfTwo;
            numberArray(i) = true;
            
        else
            numberArray(i) = false;
        end
        
        % Increments the position to next one.
        
        i = i + 1;
    end
    
    % Reverese the vector, as we iterated from the larger values to the smaller
    % ones.
    
    numberArray = fliplr(numberArray);
    
    % Sends signal to acquisition computer.
    
    %Send_TTL_array(numberArray)
        
end