
if i==101 
    Intro24
    Intro14
    showFixationCross;
end

if  concordant==0 & nonconcordant==1
    
    if i<101
         k=k+1;
         imageTextureToShow = SBS(b.b(k));
         image_nb=fileNum(b.b(k));
         resp=Resp_2;
         trigger=2;
    
    elseif i>=101
         j=j+1;
         imageTextureToShow = DBS(c.c(j));
         image_nb=fileNum(c.c(j));
         resp=Resp_3;
         trigger=3;
    end

elseif concordant==1 & nonconcordant==0
   
    if i<101
        
        j=j+1;
        imageTextureToShow = DBS(c.c(j));
        image_nb=fileNum(c.c(j));
        resp=Resp_3;
        trigger=3;
   
    elseif i>=101
        k=k+1;
        imageTextureToShow = SBS(b.b(k));
        image_nb=fileNum(b.b(k));
        resp=Resp_2;
        trigger=2;
    end
end