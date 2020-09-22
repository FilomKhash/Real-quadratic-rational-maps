function array=auxiliary(s)
% The kneading coordinate for the tent map: 
%{0<=x<=1->sx when x<=0.5& s(1-x) when x>=0.5}.
% The maps are +- unimodal with the unique turning point 0.5.
% For keeping track of the itinerary, the left lap, the turning point and
% the right lap are denoted by +1,0 and -1 respectively according to the
% orientation of function. So in the ordering +1<0<-1.
array(1)=0;
turning=0.5;
for i=2:100
    if turning<=0.5
        turning=s*turning;
    else
        turning=s-s*turning;
    end
    if turning<0.5
        array(i)=+1;
    elseif turning==0.5
        array(i)=0;
    else
        array(i)=-1;
    end
end

    
