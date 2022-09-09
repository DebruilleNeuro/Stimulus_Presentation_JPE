
if i==101 
    Intro24
    Intro14
    showFixationCross;
end


if mod(a.a(i),2)==1
    k=k+1;
    imageTextureToShow = SBS(b.b(k));
    image_nb=fileNum(b.b(k));
    resp=Resp_2;
    trigger=2;
elseif mod(a.a(i),2)==0;
    j=j+1;
    imageTextureToShow = DBS(c.c(j));
    image_nb=fileNum(c.c(j));
    resp=Resp_3;
    trigger=3;
end