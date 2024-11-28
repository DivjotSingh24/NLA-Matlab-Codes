p=[4 7 9 13];
f=[18 63 90 182];
x=11;
sum=0;
n=4;
l=ones(n,1);
for i = 1:n
    for j=1:n
        if(j~=i)
            l(i)=l(i)*(x-p(j))/(p(i)-p(j));
        end
    end
    sum=sum+(l(i)*f(i));
end
fprintf("The sum is: %f\n",sum);
