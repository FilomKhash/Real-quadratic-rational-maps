function entropy=entropy1(mu,a)
% The entropy for the family of quadratic +- unimodal rational map {x->mu*x*(ax+1)/((a*x+1)^2+x^2)}_mu
%which is defined over the interval (mu/2,-mu/2) with the unique critical
%point -1/(1+a)<0. Here 0<a<1, mu<0 varies between -2/(1-a) and -2/(1+a). The
%other critical point 1/(1-a) is outside this interval.
array(1)=0;
turning=-1/(1+a);
for i=2:100
        turning=mu*turning*(1+a*turning)/((1+a*turning)^2+turning^2);
    if turning<-1/(1+a)
        array(i)=+1;
    elseif turning==-1/(1+a)
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
