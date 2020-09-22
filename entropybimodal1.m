function entropy=entropybimodal1(mu,t)
%The entropy of the +-+ bimodal map
%f: x->2*mu*x*(t*x+2)/((t*x+2)^2+mu^2*x^2):[-1,1]->[-1,1]
%where mu<=t-2<=-2.
format long
kneading=kneading1(mu,t);
a=1; b=3; s=2; c=1/4; d=1/2; %counter=0; 
while b-a>10^(-3)
    %counter=counter+1
    %The only situation where c,d change is the case of the last while loop
    %and then d-c being less than 10^(-6) means the failure. So we check it
    %at the beginning of the first while loop. 
    if d-c<10^(-6)
        entropy=-2;
        %a,b
        %entropy=log((a+b)/2);
        %display('failure')
        return
    end
    s=(a+b)/2; c=(s-1)/(2*s); d=1/s;
   % a, b, s, c, d, display('loop')
    matrix1=piecewisekneading1(s,c);
    matrix2=piecewisekneading1(s,d);
    if isequal(kneading,matrix1) || isequal(kneading,matrix2)
        entropy=log(s);
        return
    end
    temp1=compare1(matrix1,kneading); temp2=compare1(matrix2,kneading);
    if temp1==1
        a=s;
    elseif temp2==1
        a=s;
    elseif temp1==-1
        b=s;
    elseif temp2==-1
        b=s;
    else
        while d-c>10^(-6)
            matrix=piecewisekneading1(s,(c+d)/2);
            temp=compare1(matrix,kneading);
            if temp==0
                entropy=log(s);
                return
            elseif temp==1
                a=s; 
                %display('1')
                break
            elseif  temp==-1
                b=s;
                %display('2')
                break
            else  
                temp=compare1(matrix(1,:),kneading(1,:));
                if temp==1
                      c=(c+d)/2;
                      %display('3')
                      %c, d,
                elseif temp==-1
                     d=(c+d)/2;
                     %display('4')
                     %d-c
                else
                   entropy=-2;
                return
                end
            end
        end
     %   a, b,
    end
end

            
            
            
          
        
        
%a
%b
%s
%c
%d
%counter
entropy=log((a+b)/2);

            
        
        
        