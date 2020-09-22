function entropyplotbimodal1alt(range1,range2)

%This code is the same as entropybimodal1, only the coloring scheme has been
%modified in order to get more proportionate colored regions. The size of
%arrays have been changed from 300*300 to 400*400. 

%Also the bounds on sigma2 has been relaxed: in the previos version(entropybimodal1)
%in the moduli space we only plotted points with abs(sigma2)<25. This restriction has been 
%removerd here. 

format long
tic

%Drawing isentropes for +-+ region of the third quadrant of the (mu,t)-plane: mu<t-2<-2
%The ranges range1<=range2<=-2 are for the mu and we are interested only to
%the part inside the parabola mu=1-t^2/4. Fixing a mu, to generate the
%second component t, we divide the interval determined by
%max(mu+2,-2*sqrt(1-mu))<=0 to 300 equal subintervals. 
seed=linspace(range1,range2,400);
%preallocating to increase the speed
mu=zeros(400,400);
t=zeros(400,400);
sigma1=zeros(400,400);
sigma2=zeros(400,400);
entropyarray=zeros(400,400);
%A sample of 300*300 points (mu,t) and the corresponding entropy values will be
%generated. There are failure cases of the algorithm in entropybimodal1
%where the output is the value -2. 
for i=1:400
    temp=linspace(max(seed(i)+2,-2*sqrt(1-seed(i))),0,400);
    for j=1:400
        mu(i,j)=seed(i);
        t(i,j)=temp(j);
        sigma1(i,j)=mu(i,j)-2+4/(mu(i,j))-t(i,j)^2/(mu(i,j));
        sigma2(i,j)=(mu(i,j)+1/(mu(i,j)))*sigma1(i,j)-(mu(i,j)^2+2/(mu(i,j)));
        entropyarray(i,j)=entropybimodal1(mu(i,j),t(i,j));
    end
end
%First, plotting in the (mu,t)-plane.
for i=1:400
    for j=1:400
        if entropyarray(i,j)==-2
            plot(mu(i,j),t(i,j),'k.')
            hold on
        elseif 0<=entropyarray(i,j)&&entropyarray(i,j)<0.05
            plot(mu(i,j),t(i,j),'b.')
            hold on
        elseif 0.05<=entropyarray(i,j)&&entropyarray(i,j)<0.2
            plot(mu(i,j),t(i,j),'m.')
            hold on
        elseif 0.2<=entropyarray(i,j)&&entropyarray(i,j)<0.3
            plot(mu(i,j),t(i,j),'g.')
            hold on
        elseif 0.3<=entropyarray(i,j)&&entropyarray(i,j)<0.5
            plot(mu(i,j),t(i,j),'c.')
            hold on
        elseif 0.5<=entropyarray(i,j)&&entropyarray(i,j)<0.66
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
%In the new figure we plot in the moduli space. 
for i=1:400
    for j=1:400
        if entropyarray(i,j)==-2
            plot(sigma1(i,j),sigma2(i,j),'k.')
            hold on
        elseif 0<=entropyarray(i,j)&&entropyarray(i,j)<0.05
            plot(sigma1(i,j),sigma2(i,j),'b.')
            hold on
        elseif 0.05<=entropyarray(i,j)&&entropyarray(i,j)<0.2
            plot(sigma1(i,j),sigma2(i,j),'m.')
            hold on
        elseif 0.2<=entropyarray(i,j)&&entropyarray(i,j)<0.3
            plot(sigma1(i,j),sigma2(i,j),'g.')
            hold on
        elseif 0.3<=entropyarray(i,j)&&entropyarray(i,j)<0.5
            plot(sigma1(i,j),sigma2(i,j),'c.')
            hold on
        elseif 0.5<=entropyarray(i,j)&&entropyarray(i,j)<0.66
            plot(sigma1(i,j),sigma2(i,j),'y.')
            hold on
        elseif 0.66<=entropyarray(i,j)
            plot(sigma1(i,j),sigma2(i,j),'r.')
            hold on
        end
    end
end

toc

