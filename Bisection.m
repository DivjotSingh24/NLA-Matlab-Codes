format short
clear all
clc

f = @(x) x * log(x) - 1.2;
a = 1.5;
b = 2.5;
n = 6;
epsilon = 5*10^(-n-1);
itermax = 70;
x0 = (a + b) / 2;
err = abs(b - a);
iter = 1;
Variables = {'Iter', 'a', 'b', 'x0', 'f_x0', 'Error'};
HG = [iter, a, b, x0, f(x0), err];

if f(a) * f(b) > 0
    error('Wrong choice of a and b.');
else
    while iter <= itermax && err >= epsilon
        if f(a) * f(x0) < 0
            b = x0;
        else
            a = x0;
        end
        x0 = (a + b) / 2;
        err = abs(b - a);
        iter = iter + 1;
        HG = [HG; iter, a, b, x0, f(x0), err];
    end
end
if size(HG, 1) < iter
    HG = [HG; iter, a, b, x0, f(x0), err];
end

Result = array2table(HG);
Result.Properties.VariableNames(1:size(HG, 2)) = Variables;
disp('Output Table with Iteration-wise Results:');
disp(Result);
x0 = x0 - rem(x0, 10^-n);
fprintf('Converged solution after %d iterations \n', iter - 1);
fprintf('Root is %2.5f \n', x0);
