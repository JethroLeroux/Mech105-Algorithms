function I = Simpson(x,y)
%This function numerically evaluates the integral of the vector of function
%values ‘y’ with respect to ‘x’
%   Inputs:
% x - vector of values
% y - vector of corresponding function values
%   Outputs:
% I - the approximate value for the integral using numerical methods

q= trapz(x,y);

if(length(x)~=length(y))
    error('The vectors do not have the same length');
end

spacing=diff(x); %determine difference between each term
if(~all(spacing==spacing(1)))
    error('The x values are not equally spaced');
end


if(mod(length(x),2)==0) %if there is an even number of points and odd number of segments
    warning('The trapezoidal rule will have to be used on the last interval');
    n=length(x);
    a=x(1);
    b=x(n-1);
    I=(b-a)*(y(1)+4*sum(y(2:2:(n-1)))+2*sum(y(3:2:(n-2)))+y(n-1))/(3*(n-2));%simpson composite rule
    
    trapezoid=(x(n)-x(n-1))*(y(n)+y(n-1))/2;%trapezoidal rule for the last segment
    I=I+trapezoid; %sum up trapezoid and simpsons values
    
else %just use simpsons 1/3 rule
    n=length(x);
    a=x(1);
    b=x(n);
    I=(b-a)*(y(1)+4*sum(y(2:2:(n-1)))+2*sum(y(3:2:(n-2)))+y(n))/(3*(n-1));%simpson composite rule
end
end
