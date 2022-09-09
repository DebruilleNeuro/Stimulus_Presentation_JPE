function Send_TTL_Now(TTL)

    slowChecks = false;
    port = uint8(0);
    address = uint64(49168);

    pp(uint8([2 3 4 5 6 7 8 9]), TTL, slowChecks, port, address); %send trigger

    WaitSecs(0.130); %wait for 5ms

    pp(uint8([2 3 4 5 6 7 8 9]), [false false false false false false false false], slowChecks, port, address); %clear port
    
    WaitSecs(0.010); %wait for 5ms
    
end