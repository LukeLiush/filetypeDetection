trainLinearReg<-function(X, y, lambda){
	print('Begin Training linear regression....')
	n<-dim(X)[2]
  	initial_theta <- numeric(n)
	
	costfunc <- function(xx, yy, lambda){
		function(p){
			costFunctionReg(theta=p, X=xx, y=yy, lambda=lambda)
		}
	}

	gradfunc <- function(xx, yy, lambda){
		function(p){
			gradFunctionReg(theta=p, X=xx, y=yy, lambda=lambda)
		}
	}
	
	mycostfunc <- costfunc(xx=X, yy=y, lambda=lambda)
	mygradfunc <- gradfunc(xx=X, y=y, lambda=lambda)
	result <- optimx(par=initial_theta, fn=mycostfunc, gr=mygradfunc, method='BFGS')

	result
}