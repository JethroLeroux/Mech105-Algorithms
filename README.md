# Mech105-Algorithms
All the algorithms I created for my Mech 105 class at Colorado State University
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
## Algorithm 2: LU Factorization Algorithm
This LU factorization algorithm returns the LU Factorization of a user-input square matrix using partial pivoting 
### Inputs:
  A - coefficient matrix for system of equations
### Outputs:
  L - lower triangular matrix
  U - upper triangular matrix
  P - the pivot matrix
## Algorithm 3: Integration Estimation Algorithm
This algorithm uses Simpson's 1/3 method and the trapezoidal method to calculate an integration estimation for a user input function. It determines if the trapezoidal rule should be used on the last interval based on how many intervals there are.
### Inputs:
  x - vector of values
  y - vector of corresponding function values
### Outputs:
  I - the approximate value for the integral using numerical methods
  ## Algorithm 4: Heun's Method Algorithm
  I am still coding this algorithm, it should be available by the end of April.