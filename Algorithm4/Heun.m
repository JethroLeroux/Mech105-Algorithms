function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%This function finds the numerical solution to the differential equation 
%dydt,over the span tspan, with an initial condition y0, and step size h.
%es and maxit refer to the stopping criterion and maximum number of 
%iterations, respectively, for iterations involving the predictor-corrector.
%Inputs:
%   dydt - the differential equation with respect to variables y and t
%   tspan - the independant variable span
%   y0 - the initial condition for the function
%   h - the step size used to numerically evaluatethe function using
%       intervals
%   es - the stopping criterion for the predictor-corrector for each
%       intervals y value
%   maxit - the max number of iterations for the predictor-corrector for 
%       each intervals y value
%Outputs:
%   t - array of t values for the functions
%   y - array of corresponding estimated y values of the solution to the
%       differential equation
if(h<0)
    error('step size cannot be negative'); %h should be a positive number
end

if(nargin==4)
        es=0.001; %default for es
        maxit=50; %default for maxit
elseif(nargin==5)
        maxit=50; %default for maxit
elseif(nargin<4)
    error('Not enough input arguments, double check all your inputs'); %terminate function
end

t = tspan(1):h:tspan(2);
if(t(length(t))~=tspan(2))
    t= [t, tspan(2)];
end

q=1;
iter=1;
ea=10000;
yi=y0;
y=zeros(1,length(t));
y(1)=y0;
while(q<length(t))
    yold=yi;
    while(iter<=maxit && ea>es)
        slopeleft=dydt(t(q),yi);
        yplus1=yold+(t(q+1)-t(q))*slopeleft;
        sloperight=dydt(t(q+1),yplus1);
        newyiplus1=yold+(t(q+1)-t(q))*(slopeleft+sloperight)/2;
        if(iter>1)
            ea=(newyiplus1-yi)/newyiplus1;
        end
        yi=newyiplus1;
        iter=iter+1;
    end
    iter=1;
    ea=10000;
    yi=newyiplus1;
    y(q+1)=yi;
    q=q+1;
end
t=t';
y=y';
plot(t,y,'--g*');
xlabel('t');
ylabel('y');
end
