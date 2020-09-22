function entropy=entropysawtooth(t)
% We want to investigate the entropy behavior of the 1-parameter family of
% +- sawtooth maps:
%{0<=x<=1->2x when x<=t/2& x->2(1-x) when 1-t/2<=x<=1 & x->t when t/2<=x<=1-t/2}. 
%The turning point is 0.5.
% The entropy increases as t increases. 
array(1)=0;
turning=0.5;
for i=2:100
    if turning<=t/2
        turning=2*turning;
    elseif turning>=1-t/2
        turning=2*(1-turning);
    else
        turning=t; 
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
%s,
entropy=log(s);
