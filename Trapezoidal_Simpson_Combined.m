% Define the function
f = @(x) sqrt(x^3 + 1);

% Take inputs for the limits and number of intervals
a = input('Enter lower limit: ');  % Lower limit
b = input('Enter upper limit: ');  % Upper limit
n = input('Enter number of intervals: ');  % Number of intervals

% Step size
h = (b - a) / n;

% --- Trapezoidal Rule Calculation ---
sum_trapezoidal = 0;
for i = 1:n-1
    x = a + (h * i);
    sum_trapezoidal = sum_trapezoidal + (2 * f(x)); % Sum the middle terms
end
result_trapezoidal = (h / 2) * (f(a) + f(b) + sum_trapezoidal); % Final result for trapezoidal
fprintf('Trapezoidal Rule Result: %f\n', result_trapezoidal);

% --- Simpson's Rule Calculation ---
sum_simpson = 0;
for i = 1:n-1
    x = a + (h * i);
    if rem(i, 2) == 0
        sum_simpson = sum_simpson + (2 * f(x)); % Even index terms
    else
        sum_simpson = sum_simpson + (4 * f(x)); % Odd index terms
    end
end
sum_simpson = sum_simpson + f(a) + f(b); % Add the first and last terms
result_simpson = (h / 3) * sum_simpson; % Final result for Simpson
fprintf('Simpson''s Rule Result: %f\n', result_simpson);
