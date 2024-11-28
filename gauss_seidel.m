clear;
A = input('Enter matrix A: ');
B = input('Enter matrix B: ');
P = input('Enter initial guess matrix: ');
e = input('Enter error margin: ');
N = length(B);
n = input('Enter no of iterations: ');
X = zeros(N, 1);
Y = zeros(N, 1);

for j = 1:n
    for i = 1:N
        X(i) = (B(i) - A(i, [1:i-1, i+1:N]) * P([1:i-1, i+1:N])) / A(i, i);
        P(i) = X(i);  % Update P immediately after calculating X(i)
    end
    %commented to not print each iteration
    % fprintf('Iteration: %d\n', j);
    % disp(X);
    
    % Check if convergence is met
    if max(abs(Y - X)) < e
        break;
    end
    Y = X;  % Update Y after checking convergence
end

disp('Final solution:');
disp(Y);
