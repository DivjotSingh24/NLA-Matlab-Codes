clc;
clear all;
format short;
x0 = [1; 1; 1];  % Initial guess for eigenvector
A = [4 1 0; 1 20 1; 0 1 4];
tol = 10^-3;   % Tolerance for convergence
N = 100;       % Max number of iterations

% Initial eigenvalue estimate
k = 50;
% Power Method Iteration
for i = 1:N
    % Step 1: Multiply matrix A by the current eigenvector approximation
    y = A * x0;
    
    % Step 2: Compute the maximum absolute value of the resulting vector y
    k1 = max(abs(y));  % New eigenvalue estimate
    
    % Step 3: Normalize the vector y to get the new eigenvector approximation
    x = y / k1;  % Normalize the vector
    
    % Step 4: Check for convergence
    if abs(k - k1) <= tol
        fprintf('Max eigenvalue = %f\n', k1);  % Print the largest eigenvalue
        break;
    end
    
    % Update eigenvalue and eigenvector for next iteration
    k = k1;
    x0 = x;
end
% Final eigenvector approximation
disp('Corresponding eigenvector:');
disp(x);
