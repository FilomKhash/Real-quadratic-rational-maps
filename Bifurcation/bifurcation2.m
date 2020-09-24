function bifurcation2(leftend,rightend)
%Bifurcation for the quadratic rational family {mu*x/(x^2+1):[0,mu/2]->[0,mu/2]}, mu>0 or
% {mu*x/(x^2+1):[mu/2,0]->[mu/2,0]} when mu<0.
%This is a unimodal family with the
%unique turning point being x=1 or x=-1.
format long
seed=linspace(leftend,rightend,20000);
c=size(seed);
if leftend>0
    crit=1;
else
    crit=-1;
end
for i=1:c(2)
        temp=crit;
    for j=1:200
        temp=seed(i)*temp/(temp^2+1);
    end
    for j=1:100
        temp=seed(i)*temp/(temp^2+1);
        orbit(i,j)=temp;
    end
end
for i=1:c(2)
    for j=1:100
        coordinates(1,100*(i-1)+j)=seed(i);
        coordinates(2,100*(i-1)+j)=orbit(i,j);
    end
end
plot(coordinates(1,:),coordinates(2,:),'.')

end
%It turns out that this is not an interesting family since always either x=0
%or x=(mu-1)^0.5 is attracting. So the entropy always vanishes as it is
%expected, this is the symmetry locus on the boundary of monotone
%increasing and degree +2 maps. 
%For mu<0, either x=0 is attracting or an attracting period two orbit emerges. 
