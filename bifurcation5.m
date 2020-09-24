function bifurcation5(leftend,rightend)
%Bifurcation for the quadratic rational family {2*mu*x*((mu+2)*x+2)/(((mu+2)*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]}, mu nonzero.
%The critical value x=-1 is mapped to the critical value x=1. What happens to
%the critical value 1? 
format long
seed=linspace(leftend,rightend,20000);
c=size(seed);
for i=1:c(2)
        temp=1;
    for j=1:200
        temp=2*seed(i)*temp*((seed(i)+2)*temp+2)/(((seed(i)+2)*temp+2)^2+seed(i)^2*temp^2);
    end
    for j=1:100
      temp=2*seed(i)*temp*((seed(i)+2)*temp+2)/(((seed(i)+2)*temp+2)^2+seed(i)^2*temp^2);
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
