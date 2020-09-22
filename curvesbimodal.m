efunction curvesbimodal
%An attempt to plot curves Per_n(0) in both unimodal and bimodal regions of the third
%quadrant. 

%Associated with a (mu,t) in this region we have a -+ unimodal (+-+ bimodal) function
%x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]
%with -1 (along with +1) its critical point. 

format long
tic

mu=zeros(12000,6000);
t=zeros(12000,6000);

seed1=linspace(-27,0,12000);
seed2=linspace(-17,0,6000);

%Generating 12000*6000 points in the third quadrant.
for i=1:12000
    for j=1:6000
        mu(i,j)=seed1(i);
        t(i,j)=seed2(j); 
    end
end

%Plotting the boundary of the rectangle:
seed11=linspace(-14,-2,3000);
seed12=linspace(-2,2,1000);

for i=1:3000
    for j=1:1000
        mu1(i,j)=(seed11(i)+seed12(j))/2;
        t1(i,j)=(seed11(i)-seed12(j))/2; 
    end
end
for i=1:3000
    plot(mu1(i,1),t1(i,1),'k.')
    hold on
    plot(mu1(i,1000),t1(i,1000),'k.')
    hold on
end

for j=1:1000
    plot(mu1(1,j),t1(1,j),'k.')
    hold on
    plot(mu1(3000,j),t1(3000,j),'k.')
    hold on
end


%The period of the critical value -1 will be recorded in the array below.
%If for that mu,t parameters, -1 is not a periodic point of the
%corresponding map, then we record 0. 
periodarray=zeros(12000,6000);



%We now use brute force: the first eight iterates of -1 under 
%x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]  
%will be calculated and if -1 occurs, we record the (exact) period. 


for i=1:12000
    for j=1:6000
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



%Next, we color the critically periodic parameters found above according to
%their corresponding periods. 
for i=1:12000
    for j=1:6000
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
        end
    end
end

        
toc
