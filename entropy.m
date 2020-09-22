function entropy=entropy(mu)
% The entropy of the logistic family. Can be modified to calculate the
% entropy of any +- unimodal family.
array(1)=0;
turning=0.5;
for i=2:100
        turning=mu*turning*(1-turning);
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
