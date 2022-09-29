if i==211 %if 211 trials passed (middle of exp), participants have a break
    Pause_text %text informing subjects of break
    Intro_different %start of 2nd half of exp, announcement that images will be different between subjects
    ShowFixationCross_SM; %show one fixation cross before restarting stimulus presentation
end

     
    %When number in cell (i) of array called 'a.conditions' (see main script)
    %is 3,8,9 or 2 then condition DBD, IN, NI, SBD will be shown, respectively. 
    % e.g if trial i = 4 => cell 4 => a.conditions = [8 3 2 *3* 2..8] 
    %=> *3* > presentation of different images to subjects et
    % trigger sent to mark condition will be 3. 
    
    %DBD
    if a.conditions(i)==3;       
        j=j+1;
        imageTextureToShow = DBD(c.DBD(j));
        image_nb=files140(c.DBD(j));
        resp=Resp_3;
        trigger=3;
        %IN
    elseif a.conditions(i)==8;
        l=l+1 
        imageTextureToShow = IN(d.IN(l));
        image_nb=files70(d.IN(l));
        resp=Resp_8;
        trigger=8;
        %NI
    elseif a.conditions(i)==9;
        m=m+1;
        imageTextureToShow = NI(e.NI(m));
        image_nb=files70(e.NI(m));
        resp=Resp_9;
        trigger=9;
       
    %SBD
    elseif a.conditions(i)==2;
        k=k+1;
      imageTextureToShow = SBD(b.SBD(k));
        image_nb=files140(b.SBD(k));
        resp=Resp_2;
        trigger=2;
    end