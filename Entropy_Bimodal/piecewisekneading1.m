function kneading=piecewisekneading1(s,t)
format long
%The kneading matrix for the boundary-anchored +-+ bimodal map on [0,1] given by
%x->s*x if 0<=x<=t, x->2*s*t-s*x if t<=x<=t+(s-1)/(2*s), x->s*x+1-s if t+(s-1)/(2*s)<=x<=1
%which has three monotone pieces of slopes +-s. 
%Here the kneading matrix is going to be calculated in the sense of the paper by
%Block and Kseeling as two arrays of numbers 0-6 demonstrating the
%itineraries of the critical values. 
% The inputes should satisfy 1<=s<=3, (s-1)/(2*s)<=t<=1/s. 
kneading=zeros(2,100);
critvalue=s*t;
for i=1:100
    if critvalue==0
        kneading(1,i)=0;
    elseif 0<critvalue && critvalue<t
        kneading(1,i)=1;
    elseif critvalue==t
        kneading(1,i)=2;
    elseif t<critvalue && critvalue<t+(s-1)/(2*s)
        kneading(1,i)=3;
    elseif critvalue==t+(s-1)/(2*s)
        kneading(1,i)=4;
    elseif t+(s-1)/(2*s)<critvalue && critvalue<1
        kneading(1,i)=5;
    else
        kneading(1,i)=6;
    end
    if critvalue<=t
        critvalue=s*critvalue;
    elseif critvalue>=t+(s-1)/(2*s)
        critvalue=s*critvalue+1-s;
    else
        critvalue=2*s*t-s*critvalue;
    end
end
critvalue=s*t-(s-1)/2;
for i=1:100
    if critvalue==0
        kneading(2,i)=0;
    elseif 0<critvalue && critvalue<t
        kneading(2,i)=1;
    elseif critvalue==t
        kneading(2,i)=2;
    elseif t<critvalue && critvalue<t+(s-1)/(2*s)
        kneading(2,i)=3;
    elseif critvalue==t+(s-1)/(2*s)
        kneading(2,i)=4;
    elseif t+(s-1)/(2*s)<critvalue && critvalue<1
        kneading(2,i)=5;
    else
        kneading(2,i)=6;
    end
    if critvalue<=t
        critvalue=s*critvalue;
    elseif critvalue>=t+(s-1)/(2*s)
        critvalue=s*critvalue+1-s;
    else
        critvalue=2*s*t-s*critvalue;
    end
end
