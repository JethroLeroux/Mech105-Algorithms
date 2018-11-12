This function finds the numerical solution to the differential equation dydt,over the span tspan, with an initial condition y0, and step size h. es and maxit refer to the stopping criterion and maximum number of iterations, respectively, for iterations involving the predictor-corrector.
###Inputs:
   dydt - the differential equation with respect to variables y and t
   tspan - the independant variable span
   y0 - the initial condition for the function
   h - the step size used to numerically evaluatethe function using intervals
   es - the stopping criterion for the predictor-corrector for each intervals y value
   maxit - the max number of iterations for the predictor-corrector for each intervals y value
###Outputs:
   t - array of t values for the functions
   y - array of corresponding estimated y values of the solution to the differential equation
