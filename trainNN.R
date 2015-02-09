trainNN <- function(hisize, X, y, lambda){
	print('Begining Training Neural Networks')
	n <- dim(X)[2]
	
	costfunc <- function(xx, yy, lambda){
		function(p){
			nnCostFunction(nn_params=p, hidden_layer_size=hisize, X=X, y=y, lambda=lambda)
		}
	}
  
	gradfunc <- function(xx, yy, lambda){
	  function(p){
	    nnGradFunction(nn_params=p, hidden_layer_size=hisize, X=X, y=y, lambda=lambda)
	  }
	}
	params <- numeric(n*hisize + hisize+1)
  print(length(params))
	mycostfunc <- costfunc(xx=X, yy=y, lambda=lambda)
	mygradfunc <- gradfunc(xx=X, y=y, lambda=lambda)
	result <- optimx(par=params, fn=mycostfunc, gr=mygradfunc, method='L-BFGS-B', control=list(maxit=400))
	result
}

