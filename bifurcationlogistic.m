function bifurcationlogistic(leftend,rightend)
%Bifurcation for the logistic family {a*x*(1-x):[0,1]->[0,1]} 0<=a<=4
format long
if leftend<0 || rightend>4 || leftend>rightend
    display('Choose a subinterval of [0,4]!')
    return
end 
seed=linspace(leftend,rightend,10000);
c=size(seed);
for i=1:c(2)
        temp=0.5;
    for j=1:200
        temp=seed(i)*temp*(1-temp);
    end
    for j=1:100
        temp=seed(i)*temp*(1-temp);
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

