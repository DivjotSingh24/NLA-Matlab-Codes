f = @(x) x .* log(x) - 1.2;
a = 1; b = 5; n = 50;
x = linspace(a, b, n); 
fx = f(x);
for i = 1:length(x)-1
    if fx(i) * fx(i+1) < 0
        fprintf('Root found in interval: [%2f, %2f] \n', x(i), x(i+1));
    end
end
