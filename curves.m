function curves
%An attempt to plot curves Per_n(0) in the unimodal region of the third
%quadrant (and also in the moduli space). 
%This is the rectangular region bounded by mu-t=+2 or -2 and 
%mu+t=-2, -14. (Of course the region continues toward the third quadrant but 
%if mu+t<-14, then we are outside the parabola which is uninteresting.)

%Associated with a (mu,t) in this region we have a -+ unimodal function
%x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]
%with -1 its unique critical point. 

format long
tic

mu=zeros(3000,1000);
t=zeros(3000,1000);
sigma1=zeros(3000,1000);
sigma2=zeros(3000,1000);

%Seeds for mu+t, mu-t respectively. 
seed1=linspace(-14,-2,3000);
seed2=linspace(-2,2,1000);


%The period of the critical value -1 will be recorded in the array below.
%If for that mu,t parameters, -1 is not a periodic point of the
%corresponding map, then we record 0. 
periodarray=zeros(3000,1000);

%Generating 3000*1000 points in this rectangular region.
for i=1:3000
    for j=1:1000
        mu(i,j)=(seed1(i)+seed2(j))/2;
        t(i,j)=(seed1(i)-seed2(j))/2; 
        sigma1(i,j)=mu(i,j)-2+4/(mu(i,j))-t(i,j)^2/(mu(i,j));
        sigma2(i,j)=(mu(i,j)+1/(mu(i,j)))*sigma1(i,j)-(mu(i,j)^2+2/(mu(i,j)));
    end
end

%We now use brute force: the first eight iterates of -1 under 
%x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]  
%will be calculated and -1 occurs, we record the (exact) period. 

%counter=0;
for i=1:3000
    for j=1:1000
        temp=-1;
        k=0;
        while k<=7
            temp=2*mu(i,j)*temp*(t(i,j)*temp+2)/((t(i,j)*temp+2)^2+mu(i,j)^2*temp^2);
            k=k+1;
            if abs(temp+1)<10^-4
               break
            end
        end
        periodarray(i,j)=k;
        %if k<8
        %    counter=counter+1;
        %end
    end
end
%counter
%periodarray

%This part of the code is optional and is meant to generate strictly
%pre-periodic curves f^5(c_2)=c_1 to see how they intersect with the
%critically periodic curves f^k(c_1)=c_1.
for i=1:3000
    for j=1:1000
        temp=1;
        for k=1:4
            temp=2*mu(i,j)*temp*(t(i,j)*temp+2)/((t(i,j)*temp+2)^2+mu(i,j)^2*temp^2);
        end
            if abs(temp+1)<10^-4 %&&mu(i,j)+t(i,j)~=-2&&mu(i,j)-t(i,j)~=-2
            %    mu(i,j), t(i,j),
            %   if periodarray(i,j)==3
            %        mu(i,j), t(i,j),
            %    end
               periodarray(i,j)=9;
            end
    end
end



%Plotting the boundary of the rectangle:
for i=1:3000
    plot(mu(i,1),t(i,1),'k.')
    hold on
    plot(mu(i,1000),t(i,1000),'k.')
    hold on
end

for j=1:1000
    plot(mu(1,j),t(1,j),'k.')
    hold on
    plot(mu(3000,j),t(3000,j),'k.')
    hold on
end


%Next, we color the critically periodic parameters found above according to
%their corresponding periods. 
for i=1:3000
    for j=1:1000
        if periodarray(i,j)==2
            plot(mu(i,j),t(i,j),'b.')
            hold on
        elseif periodarray(i,j)==3
            plot(mu(i,j),t(i,j),'g.')
            hold on
        elseif periodarray(i,j)==4
            plot(mu(i,j),t(i,j),'m.')
            hold on
        elseif periodarray(i,j)==5
            plot(mu(i,j),t(i,j),'c.')
            hold on
        elseif periodarray(i,j)==6
            plot(mu(i,j),t(i,j),'r.')
            hold on
        elseif periodarray(i,j)==7
           plot(mu(i,j),t(i,j),'y.')
           hold on
        elseif periodarray(i,j)==9
           plot(mu(i,j),t(i,j),'k.')
           %mu(i,j), t(i,j),
           hold on
        end
    end
end

%Drawing curves in the moduli space (optional):
% off
%figure

%Plotting the lines sigma1=-6, sigma1=2:
%for i=1:3000
%    plot(sigma1(i,1),sigma2(i,1),'k.')
%    hold on
%    plot(sigma1(i,1000),sigma2(i,1000),'k.')
%    hold on
%end


%for i=1:3000
%    for j=1:1000
%        if periodarray(i,j)==2
%            plot(sigma1(i,j),sigma2(i,j),'b.')
%            hold on
%        elseif periodarray(i,j)==3
%            plot(sigma1(i,j),sigma2(i,j),'g.')
%            hold on
%        elseif periodarray(i,j)==4
%            plot(sigma1(i,j),sigma2(i,j),'m.')
%            hold on
%        elseif periodarray(i,j)==5
%            plot(sigma1(i,j),sigma2(i,j),'c.')
%            hold on
%        elseif periodarray(i,j)==6
%            plot(sigma1(i,j),sigma2(i,j),'r.')
%            hold on
%        elseif periodarray(i,j)==7
%           plot(sigma1(i,j),sigma2(i,j),'y.')
%           hold on
%        end
%    end
%end

toc
