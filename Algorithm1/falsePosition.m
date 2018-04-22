%% HW10 scenario

K=0.05;
pt=3;
func = @x, x/(1-x)*sqrt((2*pt)/(2+x)-K;

%% False Pos. Function From Homework 9
function [root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
%falsePosition(func,xl,xu,es,maxiter) returns the estimate of the root
%   of a user input function
% Inputs:
%  func-the user's function to be evaluated
%  xl-the users initial guess for the lower limit of the bracket of the root
%  xu-the users initial guess for the upper limit of the bracket of the root
%  es (optional)-the desired relative error (should default to 0.0001%)
% maxiter(optional)-the number of iterations desired (should default to 200)
% 
%Outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

iter=0;     %initialize variables
ea=100;
fx=0;
root=0;

original_xl= xl;
original_xu= xu;

if(nargin<3||nargin>5)
    error('Incorrect number of input arguments, see function description');
elseif(nargin==4)%checks if maxiter variable has been parsed
    maxiter=200;
elseif(nargin==3)%when both optional variables haven't been parsed
    maxiter=200;
    es=0.0001;
end

actualroot=fzero(char(func),(xl+xu)/2); %checks for a root in the middle of the bracket for simplicity

if(actualroot<xu && actualroot>xl )%checks if there actually is a root in the bracket
    while(ea>=es && iter<maxiter)%runs until desired error or until max iteration has been reached
        root=double(xu-((func(xu))*(xl-xu))/((func(xl))-(func(xu))));%estimate root
        fx=double(func(root));
        ea=abs(double((root-actualroot)/actualroot));%calculate relative error
        iter=iter+1;
        
        if(sign(fx)~=sign(func(xu)))%if there is a root between the estimate and the upper bracket
            xl=root;
        else
            xu=root; 
        end
    end
    
else
    error('This bracket doesn''t contain a root,or it contains more than one');
end
fprintf('The root estimate of the function %s in the bracket [%f, %f] is %.4f. It took %d iterations to get to a relative error of %.4e from the actual root of the function',char(func),original_xl,original_xu,root,iter,ea);
end

