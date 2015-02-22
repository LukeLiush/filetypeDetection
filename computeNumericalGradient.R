computeNumericalGradient<-function(J, theta){
	#COMPUTENUMERICALGRADIENT Computes the gradient using "finite differences"
	#and gives us a numerical estimate of the gradient.
	#   numgrad = COMPUTENUMERICALGRADIENT(J, theta) computes the numerical
	#   gradient of the function J around theta. Calling y = J(theta) should
	#   return the function value at theta.

	# Notes: The following code implements numerical gradient checking, and 
	#        returns the numerical gradient.It sets numgrad(i) to (a numerical 
	#        approximation of) the partial derivative of J with respect to the 
	#        i-th input argument, evaluated at theta. (i.e., numgrad(i) should 
	#        be the (approximately) the partial derivative of J with respect 
	#        to theta(i).)
	#           
	numgrad <- numeric(length(theta))
	perturb <- numeric(length(theta))
	EPSILON <- 0.0001
	nn = length(theta)
	for (p in 1:nn){
	    # Set perturbation vector
	    perturb[p] <- EPSILON;
	    loss1 <- J(theta - perturb)
	    loss2 <- J(theta + perturb)
	    # Compute Numerical Gradient
	   	numgrad[p] <- ((loss2 - loss1) / (2*EPSILON))
	    perturb[p] <- 0;
	}
	numgrad
}