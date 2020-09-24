function bifurcation3(leftend,rightend)
%Bifurcation for the quadratic rational family {4*mu*x*(x+1)/(4*(x+1)^2+mu^2*x^2):[0,1]->[0,1]}, mu>4.
%This is a unimodal family with the
%unique turning point being x=2/(mu-2).
format long
seed=linspace(leftend,rightend,20000);
c=size(seed);
for i=1:c(2)
        temp=2/(seed(i)-2);
    for j=1:200
        temp=4*seed(i)*temp*(temp+1)/(4*(temp+1)^2+seed(i)^2*temp^2);
    end
    for j=1:100
        temp=4*seed(i)*temp*(temp+1)/(4*(temp+1)^2+seed(i)^2*temp^2);
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
%Again, not an interesting family. There is always an attracting fixed point. 
