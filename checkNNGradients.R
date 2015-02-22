checkNNGradients <- function(lambda){

	input_layer_size <- 3 # including one bias unit
	hidden_layer_size <- 5
	num_labels = 1
	m = 5
	
	# We generate some 'random' test data
	# please ensure the input_layer_size has one more for the bias
	Theta1 <- debugInitializeWeights(hidden_layer_size, input_layer_size);
	Theta2 <- debugInitializeWeights(num_labels, hidden_layer_size+1);
	
	# Reusing debugInitializeWeights to generate X
	X_ <- debugInitializeWeights(m, input_layer_size )
	y_ <- vector('numeric', m) +1
	
	# Unroll parameters
	nn_params <-c(sapply(Theta1, function(xx){xx}), sapply(Theta2, function(xx){xx}))
	
	# Short hand for cost function	
	costfunc <- function(xx, yy, lambda){
		function(p){
			nnCostFunction(nn_params=p, hidden_layer_size=hidden_layer_size, X=xx, y=yy, lambda=lambda)
		}
	}
	gradfunc <- function(xx, yy, lambda){
	  function(p){
	    nnGradFunction(nn_params=p, hidden_layer_size=hidden_layer_size, X=xx, y=yy, lambda=lambda)
	  }
	}
	mycostfunc <- costfunc(xx=X_, yy=y_, lambda=lambda)
	mygradfunc <- gradfunc(xx=X_, yy=y_, lambda=lambda)
	cost<-mycostfunc(nn_params)
	grad<-mygradfunc(nn_params)
	print('the following is the derivative gradients, please compare with the numerical gradients')
	print(length(grad))
	print(grad)
	numgrad = computeNumericalGradient(mycostfunc, nn_params)
	print('the following is the numerical gradients')
	print(length(numgrad))
	print(numgrad)
}