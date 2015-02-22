trainNN <- function(hisize, X, y, lambda){
	print('Begining Training Neural Networks')
	n <- dim(X)[2]
	
	costfunc <- function(xx, yy, lambda){
		function(p){
			nnCostFunction(nn_params=p, hidden_layer_size=hisize, X=xx, y=yy, lambda=lambda)
		}
	}
  
	gradfunc <- function(xx, yy, lambda){
	  function(p){
	    nnGradFunction(nn_params=p, hidden_layer_size=hisize, X=xx, y=yy, lambda=lambda)
	  }
	}
	#params <- numeric(n*hisize + hisize+1)
	#randamize weights
	params <- randInitWeights(n*hisize + hisize+1)
  
	print(sprintf('the length of weights %d', length(params)))
	mycostfunc <- costfunc(xx=X, yy=y, lambda=lambda)
	mygradfunc <- gradfunc(xx=X, yy=y, lambda=lambda)
	#result <- optimx(par=params, fn=mycostfunc, gr=mygradfunc, control=list( maxit=400, all.methods=T))
	result <- optimx(par=params, fn=mycostfunc, gr=mygradfunc,  method='BFGS', control=list( maxit=400))
	result
}

