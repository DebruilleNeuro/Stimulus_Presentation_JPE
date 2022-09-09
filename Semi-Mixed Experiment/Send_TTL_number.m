

function Send_TTL_number(iNumber)

    % Checks that the number is valid.
    
    if iNumber > 255 || iNumber < 0
        error('Number to send is invalid: larger than 255 or smaller than 0.')
    end
    
    % Creates the array that will be sent to the acquisition computer.
    
    numberArray = false(1,8)
    
    % We use 'i' to know which position we are visiting.
    
    i = 0;
    
    % Iterate over all elements of array, setting the 
    %value either to true or false.
    
    for element = numberArray
    
        % We calculate the power of two of the current position.
        
        currentPowerOfTwo = 2^(7 - i)       
        
        % If the number is greater or equal to the power of two,
        % substract that number and set position to true. Otherwise,
        % set position to false.
        
        if iNumber >= currentPowerOfTwo
        
            iNumber = iNumber - currentPowerOfTwo
            numberArray(i + 1) = true
            
        else
        
            numberArray(i + 1) = false
            
        end
        
        % Increments the position to next one.
        
        i = i + 1;
    end
    
    % Reverese the vector, as we iterated from the larger values to the smaller
    % ones.
    
    numberArray = fliplr(numberArray);
    
    % Displays vector, for testing purposes.
    
    disp(numberArray);
    
    % Sends signal to acquisition computer.
    
    Send_TTL(numberArray)
        
end

function Send_TTL(TTL)

    pp(uint8([2 3 4 5 6 7 8 9]), TTL, false, uint8(0)); %send trigger

    WaitSecs(0.010); %wait for 2ms

    pp(uint8([2 3 4 5 6 7 8 9]), [false false false false false false false false], false, uint8(0)); %clear port
end

