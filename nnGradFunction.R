nnGradFunction <- function(nn_params, hidden_layer_size, X, y, lambda){
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
  #J <- 0
  
  #z1 <- X %*% t(Theta1) # m x 26
  #a1 <- sigmoid(z1)
  
  #a1 <- cbind(numeric(m)+1, a1) # m x 27
  
  #z2 <- a1 %*% t(Theta2) # m x 1
  #a2 <- sigmoid(z2)
  #hh <- t(a2) # 1 x m
  
  theta1Without1 <- Theta1[,2:input_layer_size]
  theta2Without1 <- Theta2[,2:(hidden_layer_size+1)]
  
  Theta1_grad <- matrix(0, nrow=hidden_layer_size, ncol=input_layer_size)
  Theta2_grad <- matrix(0, nrow=1, ncol=(hidden_layer_size+1))
 
  #backprop learning
  for (t in 1:m){
    a1 <- X[t,] # 257 x 1 vector, i.e. n+1 x 1; in R this returns a vector which is 257 x 1
    
    z2 <- Theta1 %*% a1 # 26 x 1 vector
  	a2 <- c(1, sigmoid(z2)) # 27 x 1 vector
  	
  	z3 <- Theta2 %*% a2 # 1 x 1 vector
  	a3 <- sigmoid(z3)
  	
  	# step 2 -  update at layer 3
  	d3 <- a3 - y[t] # 1 x 1 vector
  	
  	# step 3 -  update at layer 2
    #print(length(Theta2[,2:(hidden_layer_size+1)]))
  	d2 <- ((Theta2[,2:(hidden_layer_size+1)]) %*% d3) * sigmoidGradient(z2) # 26 x 1 vector
  
    # step 4 - Accumulate update on weights  
    Theta1_grad <- Theta1_grad + d2 %*% t(a1) # 26 x 257
    Theta2_grad <- Theta2_grad + d3 %*% t(a2) # 1 x 27
  }
  
  Theta1_grad <- (1/m) * Theta1_grad + (lambda/m) * cbind(numeric(hidden_layer_size), theta1Without1)
  Theta2_grad <- (1/m) * Theta2_grad + (lambda/m) * c(0, theta2Without1)
  
  # Unroll gradients
  tmpFunc <- function(x){
    x
  }
  grad <- c(sapply(Theta1_grad, tmpFunc), sapply(Theta2_grad, tmpFunc))
  
  grad
}