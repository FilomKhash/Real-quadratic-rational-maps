function c=compare1(matrix1,matrix2)
%The function is used to compare two 2*100 kneading matrices for +-+ bimodal maps. 
%1 indicates matrix1<matrix2    -1 indicates matrix1>matrix2     0 means equality     -2 means failure.
%c1 is the result of the comparison of the first rows and c2 is that for
%the second rows. The output c=0 || -1 || 1 || -2 can be quickly determnined based on them.  
counter=1;
%The variable counter indicates the first position where they differ. So
%they are the same on entries 1 through counter-1. 
while counter<=100 && matrix1(1,counter)==matrix2(1,counter)
    counter=counter+1;
end
if counter==101
    c1=0;
elseif counter==1
    if matrix2(1,1)-matrix1(1,1)>0
        c1=1;
    else
        c1=-1;
    end
else
    k=0;
    for i=1:counter-1 
        if mod(matrix1(1,i),2)==1
        k=k+1;
        end
    end
    if k==counter-1
        l=0;
        for i=1:counter-1
            if matrix1(1,i)==3
                l=l+1;
            end
        end
        if (-1)^l*(matrix2(1,counter)-matrix1(1,counter))>0
            c1=1;
        else
            c1=-1;
        end
    else
        c1=-2;
    end
end
if c1==-2
    c=-2;
    return
end

%Comparing two row matrices
if size(matrix1)==[1,100]
    c=c1;
    return
end

counter=1;
while counter<=100 && matrix1(2,counter)==matrix2(2,counter)
    counter=counter+1;
end
if counter==101
    c2=0;
elseif counter==1
    if matrix2(2,1)-matrix1(2,1)>0
        c2=1;
    else
        c2=-1;
    end
else
    k=0;
    for i=1:counter-1 
        if mod(matrix1(2,i),2)==1
        k=k+1;
        end
    end
    if k==counter-1
        l=0;
        for i=1:counter-1
            if matrix1(2,i)==3
                l=l+1;
            end
        end
        %l
        if (-1)^l*(matrix2(2,counter)-matrix1(2,counter))>0
            c2=1;
        else
            c2=-1;
        end
    else
        c2=-2;
    end
end
if c2==-2
    c=-2;
    return
end

%c1
%c2

if c1==0 && c2==0
    c=0;
    return
elseif c1>=0 && c2<=0
    c=1;
elseif c1<=0 && c2>=0
    c=-1;
else
    c=-2;
end


            
