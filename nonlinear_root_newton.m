clc
i = 1;
f = @(x) x^2 - 17;  % Function to find root of
tol = 0.00001;       % Tolerance level
N = 100;             % Maximum number of iterations
x0 = 4;              % Initial guess
df = @(x) 2 * x;     % Derivative of the function

while i <= N
    x1 = x0 - (f(x0) / df(x0));  
    fprintf('Iteration %d: x1 = %.5f\n', i, x1);
    
    if abs(x1 - x0) < tol 
        fprintf('Converged after %d iterations.\n', i);
        break;
    end
    
    i = i + 1;
    x0 = x1;  
end

if i > N
    disp('Maximum iterations reached without convergence');
end

fprintf('Root is: %.5f\n', x1);
