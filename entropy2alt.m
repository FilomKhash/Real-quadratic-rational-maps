function entropy=entropy2alt(a)
% The entropy of the rational map
%x->a*(-1+1/x^2):[-a,+\infty]->[-a,+\infty] (a>0)
%which is +- is going to be calculated. The itinerary of the critical point is 
%going to be compared with that of the tent family which is of the same shape.
%Therefore, the functions  auxiliary and compare will be called.
format long
array=zeros(1,100);
%The first few entries of the kneading array could be calculated
%explicitly. The first one is 0 (the critical point itself), the second one
%is the -1 (the critical value +\infty lies to the right of 0) and the
%third one is +1 (the critical value +\infty goes to -a<0). We continue the
%orbit thereafter.
array(1)=0;
array(2)=-1;
array(3)=+1;
turning=-a;
for i=4:100
        turning=a*(-1+1/turning^2);
    if turning<0
        array(i)=+1;
    elseif turning==0
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