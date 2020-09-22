function entropy=entropy2(mu)
% The entropy for certain family of unimodal -+ quadratic rational maps where critical orbits merge.  
%{x->2*mu*x*((mu+2)*x+2)/(((mu+2)*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]}_{mu<0}
%Critical points are -1/(mu+1) and -1 where the later is mapped to the
%former. When mu<-2, the critical point -1/(mu+1) is in [-1,0] and so we
%are dealing with a unimodal map of the interval [-1,1] which is -+ as
%-1->1. Our entropy algorithm is for +- maps so we conjugate this with
%x->-x and consider the map
%x->2*mu*x*(-(mu+2)*x+2)/((-(mu+2)*x+2)^2+mu^2*x^2)of the same interval
%which is +- and with the turning point 1/(mu+1).
array(1)=0;
turning=1/(mu+1);
for i=2:100
        turning=2*mu*turning*(-(mu+2)*turning+2)/((-(mu+2)*turning+2)^2+mu^2*turning^2);
    if turning<1/(mu+1)
        array(i)=+1;
    elseif turning==1/(mu+1)
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
