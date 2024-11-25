format long
clear all
clc
syms x
f = @(x) x * log10(x) - 1.2;
df=diff(f,x);
dfx = @(x) df;
x0=1.5;
n=4;
Variables = {'Iter', 'x', 'f_x0', 'Error'};
iter=1;
err=abs(f(x0));
epsilon=5*10^(-n-1);
itermax=70;
HG=[];
if dfx(x0)<10^(-9)
    disp('Wrong choice of initial guess');
else
    while (iter<=itermax && err>epsilon)
        x1= x0-f(x0)/dfx(x0);
        err = abs(f(x0));
        HG=[HG;iter x0 f(x0) err];
        iter=iter+1;
        x0=x1;
    end
end
disp('Output Table with Iteration wise')
Result= array2table(HG);
Result.Properties.VariableNames(1:size(HG,2)) = Variables;
x0= x0-rem(x0,10^-n);
fprintf('Converged solution after %d iterations \n', iter);
fprintf('Root is %2.5f \n', x0)