function entropyalongcurves
%Entropy values along curves Per_n(0) in the bimodal regions of the third
%quadrant. 

%Associated with a (mu,t) in this region we have a -+ unimodal (+-+ bimodal) function
%x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]
%with -1 (along with +1) its critical point. 

format long
tic

mu=zeros(14000,7000);
t=zeros(14000,7000);

seed1=linspace(-50,-2,14000);
seed2=linspace(-30,0,7000);

%Generating 12000*6000 points in the third quadrant.
for i=1:14000
    for j=1:7000
        mu(i,j)=seed1(i);
        t(i,j)=seed2(j); 
    end
end

%The period of the critical value -1 will be recorded in the array below.
%If for that mu,t parameters, -1 is not a periodic point of the
%corresponding map, then we record 0. 
periodarray=zeros(14000,7000);



%We now use brute force: the first eight iterates of -1 under 
%x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]  
%will be calculated and if -1 occurs, we record the (exact) period. 


for i=1:14000
    for j=1:7000
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
for i=1:14000
    for j=1:7000
        if periodarray(i,j)==3&&mu(i,j)-t(i,j)<=-2
            plot(mu(i,j),entropybimodal1(mu(i,j),t(i,j)),'g.')
            hold on
        end
    end
end
figure
for i=1:14000
    for j=1:7000
        if periodarray(i,j)==4&&mu(i,j)-t(i,j)<=-2
            plot(mu(i,j),entropybimodal1(mu(i,j),t(i,j)),'m.')
            hold on
        end
    end
end
figure
for i=1:14000
    for j=1:7000
        if periodarray(i,j)==5&&mu(i,j)-t(i,j)<=-2
            plot(mu(i,j),entropybimodal1(mu(i,j),t(i,j)),'c.')
            hold on
        end
    end
end
figure
for i=1:14000
    for j=1:7000
        if periodarray(i,j)==6&&mu(i,j)-t(i,j)<=-2 && mu(i,j)<-9 && -6<t(i,j)
            plot(mu(i,j),entropybimodal1(mu(i,j),t(i,j)),'r.')
            hold on
        end
    end
end
figure
for i=1:14000
    for j=1:7000
        if periodarray(i,j)==7&&mu(i,j)-t(i,j)<=-2 
            plot(mu(i,j),entropybimodal1(mu(i,j),t(i,j)),'y.')
            hold on
        end
    end
end

        
toc
