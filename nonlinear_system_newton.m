clc;
clear;

% Initialization
k = 1;                % Iteration counter
tol = 0.0001;         % Tolerance level
N = 100;              % Maximum number of iterations
P = [1.2; 1.2];         % Initial guess (column vector)
error = 1;            % Initial error

% Define the nonlinear equations and Jacobian matrix
f = @(x, y) [x^2 + y^2 - 1; 2*x^2 + 3*y^2 - 2];  % System of nonlinear equations
J = @(x, y) [2*x, 2*y; 4*x, 6*y];               % Jacobian matrix

while error > tol && k <= N
    F = f(P(1), P(2));          % Evaluate the function at P
    Jac = J(P(1), P(2));        % Evaluate the Jacobian at P
    Q = P - Jac \ F;            % Update using Newton's method
    error = norm(P - Q);        % Calculate the error (norm of the difference)
    P = Q;                      % Update P
    k = k + 1;                  % Increment iteration counter
end

% Display results
if error <= tol
    disp(['Solution converged in ', num2str(k - 1), ' iterations.']);
    disp(['Root is: P1 (x) = ', num2str(P(1)), ', P2 (y) = ', num2str(P(2))]);
else
    disp(['Solution did not converge within ', num2str(N), ' iterations.']);
end
