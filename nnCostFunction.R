nnCostFunction <- function(nn_params, hidden_layer_size, X, y, lambda){
	# please ensure the X is assigned with bias unites for weights update.
	# Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
	# for our 2 layer neural network
  input_layer_size <- dim(X)[2]
  n1 <- input_layer_size * hidden_layer_size
	Theta1 <- matrix(nn_params[1:n1], nrow=hidden_layer_size, ncol=input_layer_size)

	n2 <- length(nn_params)	
	Theta2 <- matrix(nn_params[n1+1:n2], nrow=1, ncol=hidden_layer_size+1)
	n2 <- n2 - n1	

	# Setup some useful variables
	m <- dim(X)[1]
         
	# You need to return the following variables correctly 
	J <- 0
	
	z1 <- X %*% t(Theta1) # m x 26
	a1 <- sigmoid(z1)

	a1 <- cbind(numeric(m)+1, a1) # m x 27
	
	z2 <- a1 %*% t(Theta2) # m x 1
	a2 <- sigmoid(z2)
	hh <- t(a2) # 1 x m
  
	theta1Without1 <- Theta1[,2:input_layer_size]
	theta2Without1 <- Theta2[,2:hidden_layer_size+1]
	J <- (-1/m) * ( log(hh) %*% y + log(1-hh) %*% (1-y) ) + lambda/(2*m) * (sum(theta1Without1 ^ 2) + sum(theta2Without1 ^2))
  
	sum(J)
}