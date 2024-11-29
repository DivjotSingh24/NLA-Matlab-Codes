clear all;
x0 = input('Enter initial guess: ');
e = input('Enter error margin: ');
syms x;
func = x * log10(x) - 1.2; % Corrected function definition
f = matlabFunction(func); % Used `matlabFunction` to create a numerical function handle
d = diff(func); % Differentiated the symbolic function
df = matlabFunction(d); % Used `matlabFunction` for the derivative function handle

% Check if derivative at the initial guess is zero
if abs(df(x0)) == 0
    fprintf('Newton Raphson method is inapplicable\n');
    return;
end

x1 = x0 - (f(x0) / df(x0)); % Initial step
i = 1; % Iteration counter

while abs(x1 - x0) > e
    x0 = x1; % Update x0 to the latest value
    x1 = x0 - (f(x0) / df(x0)); % Compute the next iteration
    i = i + 1; % Increment iteration counter
end

% Display the results
fprintf('The root is: %f\n', x0);
fprintf('No of iterations is %d\n', i);
