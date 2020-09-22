function entropyplot(range1,range2,range3,range4)
format long
% The first two ranges for mu+t:  range1<=mu+t<=range2. Hence 2<=range1<=range2 or range1<=range2<=-2.  
%The rest are for mu-t: range3<=mu-t<=range4. Hence -2<=range3<=range4<=2. 
% Seeds for mu+t where |mu+t|>=2:
seed1=linspace(range1,range2,300);
%Seeds for mu-t where |mu-t|<=2:
seed2=linspace(range3,range4,300);
% A 300*300 array of points (mu,t) is going to be obtained from seed1 and seed2 along with the 
%corresponding entropy values.
%preallocationg to increase the speed
mu=zeros(300,300);
t=zeros(300,300);
sigma1=zeros(300,300);
sigma2=zeros(300,300);
entropyarray=zeros(300,300);
for i=1:300
    for j=1:300
        mu(i,j)=(seed1(i)+seed2(j))/2;
        t(i,j)=(seed1(i)-seed2(j))/2; 
        entropyarray(i,j)=entropyunimodal(mu(i,j), t(i,j));
        sigma1(i,j)=mu(i,j)-2+4/(mu(i,j))-t(i,j)^2/(mu(i,j));
        sigma2(i,j)=(mu(i,j)+1/(mu(i,j)))*sigma1(i,j)-(mu(i,j)^2+2/(mu(i,j)));
    end
end

%First, plotting in the (mu,t)-plane.
for i=1:300
    for j=1:300
        if entropyarray(i,j)<0.1
            plot(mu(i,j),t(i,j),'k.')
            hold on
        elseif 0.1<=entropyarray(i,j)&&entropyarray(i,j)<0.2
            plot(mu(i,j),t(i,j),'b.')
            hold on
        elseif 0.2<=entropyarray(i,j)&&entropyarray(i,j)<0.3
            plot(mu(i,j),t(i,j),'m.')
            hold on
        elseif 0.3<=entropyarray(i,j)&&entropyarray(i,j)<0.4
            plot(mu(i,j),t(i,j),'g.')
            hold on
        elseif 0.4<=entropyarray(i,j)&&entropyarray(i,j)<0.5
            plot(mu(i,j),t(i,j),'c.')
            hold on
        elseif 0.5<=entropyarray(i,j)&&entropyarray(i,j)<0.6
            plot(mu(i,j),t(i,j),'y.')
            hold on
        else
            plot(mu(i,j),t(i,j),'r.')
            hold on
        end
    end
end
hold off
figure
%In the new figure, the plotting in the moduli space will appear. 
for i=1:300
    for j=1:300
        if entropyarray(i,j)<0.1&&abs(sigma2(i,j))<10
            plot(sigma1(i,j),sigma2(i,j),'k.')
            hold on
        elseif 0.1<=entropyarray(i,j)&&entropyarray(i,j)<0.2&&abs(sigma2(i,j))<10
            plot(sigma1(i,j),sigma2(i,j),'b.')
            hold on
        elseif 0.2<=entropyarray(i,j)&&entropyarray(i,j)<0.3&&abs(sigma2(i,j))<10
            plot(sigma1(i,j),sigma2(i,j),'m.')
            hold on
        elseif 0.3<=entropyarray(i,j)&&entropyarray(i,j)<0.4&&abs(sigma2(i,j))<10
            plot(sigma1(i,j),sigma2(i,j),'g.')
            hold on
        elseif 0.4<=entropyarray(i,j)&&entropyarray(i,j)<0.5&&abs(sigma2(i,j))<10
            plot(sigma1(i,j),sigma2(i,j),'c.')
            hold on
        elseif 0.5<=entropyarray(i,j)&&entropyarray(i,j)<0.6&&abs(sigma2(i,j))<10
            plot(sigma1(i,j),sigma2(i,j),'y.')
            hold on
        elseif 0.6<=entropyarray(i,j)&&abs(sigma2(i,j))<10
            plot(sigma1(i,j),sigma2(i,j),'r.')
            hold on
        end
    end
end




       