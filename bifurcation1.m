function bifurcation1(mu)
%Bifurcation for the quadratic rational family {mu*x/(x^2+a*mu*x+1):[mu/(a*mu-2),0]->[mu/(a*mu-2),0]} 
%0<mu<4 an input and |2/mu-1|<a<2/mu. This is a unimodal family with the
%unique turning point being x=-1.
format long
seed=linspace(abs(2/mu-1),2/mu-0.1,20000);
% When a is in a vicinity of mu/2, the calculations tend to be unstable since
% a*mu-2 appears in the denominator. So I won't allow a to be within the
% 0.1 range of 2/mu. 
c=size(seed);
for i=1:c(2)
        temp=-1;
    for j=1:200
        temp=mu*temp/(temp^2+seed(i)*mu*temp+1);
    end
    for j=1:100
        temp=mu*temp/(temp^2+seed(i)*mu*temp+1);
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
