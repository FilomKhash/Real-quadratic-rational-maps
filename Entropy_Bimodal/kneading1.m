function kneading=kneading1(mu,t)
%The kneading matrix for the +-+ bimodal map
%f: x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]
%where parameters mu, t are taken from the third quadrant: mu<=t-2<=-2.
%Critical points are -1<=2/(mu-t)<0<-2/(mu+t)<=1. 
% To make the algorithm work, according to the convention in the article by
% Block and Keesling, this map has to be extended to a +-+ bimodal
% boundary-anchored one. Thus it is going to be considered as such a map on
% [-2,2] in the obvious way: linear on [-2,-1] and [1,2] with 
%-2->-2, -1->f(-1) and 1->f(1), 2->2. 
%The only modification necessary is that 0,6 (originally corresponding to endpoints -1,1)
%will not happen. 
kneading=zeros(2,100);
critvalue=1;
%2/(mu-t)->1
for i=1:100
    if -1<=critvalue && critvalue<2/(mu-t)
       kneading(1,i)=1;
    elseif critvalue==2/(mu-t)
       kneading(1,i)=2;
    elseif 2/(mu-t)<critvalue && critvalue<-2/(mu+t)
       kneading(1,i)=3;
    elseif  critvalue ==-2/(mu+t)
       kneading(1,i)=4;
    else  
       kneading(1,i)=5;
    end
critvalue =2*mu*critvalue*(t*critvalue+2)/(mu^2*critvalue^2+(t*critvalue+2)^2);
end
critvalue=-1;
%-2/(mu+t)->-1
for i=1:100
    if -1<=critvalue && critvalue<2/(mu-t)
        kneading(2,i)=1;
    elseif critvalue==2/(mu-t);
        kneading(2,i)=2;
    elseif 2/(mu-t)<critvalue && critvalue<-2/(mu+t)
        kneading(2,i)=3;
    elseif critvalue==-2/(mu+t)
        kneading(2,i)=4;
    else 
        kneading(2,i)=5;
    end
 critvalue=2*mu*critvalue*(t*critvalue+2)/(mu^2*critvalue^2+(t*critvalue+2)^2);
end

 
            
       