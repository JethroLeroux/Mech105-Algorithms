## Algorithm 1: False Position Algorithm
this False Position algorithm returns the estimate of the root of a user input function using the False Position method of root estimation.
### Inputs:
  func-the user's function to be evaluated
  xl-the users initial guess for the lower limit of the bracket of the root
  xu-the users initial guess for the upper limit of the bracket of the root
  es (optional)-the desired relative error (should default to 0.0001%)
  maxiter(optional)-the number of iterations desired (should default to 200)
### Outputs:
  root - the estimated root location
  fx - the function evaluated at the root location
  ea - the approximate relative error (%)
  iter - how many iterations were performed
