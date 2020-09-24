function entropy=entropyunimodal(mu,t)
% The entropy of the map  
%x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]
%which is -+ unimodal when mu*t>=0 and t satisfies certain inequalities in terms of the nonzero parameter mu. 
%Critical points and values are 2/(mu-t)->1 and 2/(-mu-t)->-1 where only the latter lies in the interval assuming
%certain inequalities are satisfied. Since this is the absolute minimum, the map is -+. Hence in order to apply 
%the algorithm to it, we conjugate it to get the +- map
%x->2*mu*x*(-t*x+2)/((-t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1] with the unique
%turning point 2/(mu+t). 
format long
array=zeros(1,100);
array(1)=0;
turning=2/(mu+t);
for i=2:100
        turning=2*mu*turning*(-t*turning+2)/((-t*turning+2)^2+mu^2*turning^2);
    if turning<2/(mu+t)
        array(i)=+1;
    elseif turning==2/(mu+t)
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
