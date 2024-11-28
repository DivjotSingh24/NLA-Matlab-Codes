clc
clear all
A = [1 3; 2 2];

% Set parameters
max_iter = 5;  % Maximum iterations
tol = 1e-3;      % Convergence tolerance

% Call the qr_algorithm function
eigenvalues = qr_algorith(A, max_iter, tol);

% QR Algorithm to find eigenvalues
function [eigenvalues] = qr_algorith(A, max_iter, tol)
    % A - Input matrix (square matrix)
    % max_iter - Maximum number of iterations
    % tol - Tolerance for convergence (when off-diagonal elements are small)

    n = size(A, 1);  % Size of the matrix A
    A_k = A;         % Initialize A_k as the input matrix

    for iter = 1:max_iter
        % Perform QR decomposition of A_k
        [Q, R] = qr(A_k)
        
        % Update A_k for the next iteration
        A_k = R * Q
        
        % Check convergence (if the off-diagonal elements are small enough)
        off_diag_norm = norm(A_k - diag(diag(A_k)), 'fro');
        if off_diag_norm < tol
            break;
        end
    end
    
    % The eigenvalues are the diagonal elements of A_k
    eigenvalues = diag(A_k);
    
    % Output the result and number of iterations
    fprintf('Eigenvalues:\n');
    disp(eigenvalues);
    fprintf('Number of iterations: %d\n', iter);
end
