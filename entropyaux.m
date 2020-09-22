function entropy=entropyaux(t)
% We want to investigate the entropy behavior of a 1-parameter +- unimodal family which is
% not boundary anchored. The family we are going to consider is 
%{0<=x<=1->2x when x<=0.5& 2t(1-x)+1-t when x>=0.5}. The turning point is 0.5 which is immediately mapped 
% to the right end and the entropy is expected to increase as t increases. 
array(1)=0;
turning=0.5;
for i=2:100
    if turning<=0.5
        turning=2*turning;
    else
        turning=2*t*(1-turning)+1-t;
    end
    if turning<0.5
        array(i)=+1;
    elseif turning==0.5
        array(i)=0;
    else
        array(i)=-1;
    end
end
%array
s1=1; s2=2;
array1=auxiliary(s1); array2=auxiliary(s2);
boolean1=compare(array1,array);
if boolean1<1
    entropy=0;
    return
end
boolean2=compare(array,array2);
if boolean2<1
    entropy=log(2);
return
end
while s2-s1>10^-10
    s=(s1+s2)/2;
    arraytemp=auxiliary(s);
    booleantemp=compare(array,arraytemp);
    if booleantemp==0
        entropy=log(s);
        return
    elseif booleantemp==1
        s2=s;
    else
        s1=s;
    end
end
entropy=log(s);
