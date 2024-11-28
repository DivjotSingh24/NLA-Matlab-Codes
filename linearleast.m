clc
clear all
 x=[-2 -1 0 1 2];
 y=[15 1 1 3 19];
n=length(x);
A=[n sum(x);sum(x) sum(x.^2)];
B=[sum(y);sum(x.*y)];
plot(x,y,'*r')
hold on
x1=A\B
f=x1(1)+x1(2)*x
plot(x,f,'b-') 
