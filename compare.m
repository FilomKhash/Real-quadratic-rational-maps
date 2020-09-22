function boolean=compare(array1,array2)
% Is array1<array2? Here array1 and array2 come from kneading coordinates
% of two +- unimodal maps. The function returns 0 when they are the same,
% returns 1 if array1<array2 and returns -1 otherwise.
counter=0;
while array1(counter+1)==array2(counter+1)
    counter=counter+1;
    if counter==100
     boolean=0;
     return    
    end
end
parity=0;
for i=1:counter
    if array1(i)==-1
        parity=parity+1;
    end
end
if ((-1)^parity)*(-array1(counter+1))>((-1)^parity)*(-array2(counter+1))
    boolean=-1;
else
    boolean=1;
end
