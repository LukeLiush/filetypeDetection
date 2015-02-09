learningCurve<-function(X, y, Xval, yval,lambda){
	# Number of training examples
  	m <-dim(X)[1]
  
  	# return these values correctly
  	error_train <-numeric(m)
  	error_val <-numeric(m)

	n <- dim(X)[2]
  	i <- 1000
  	while(i <= m){
    		x1 <- data.matrix(X[1:i,])
    		y1 <- data.matrix(y[1:i])
    		#print(dim(y1))

    		theta <- coef(trainLinearReg(x1, y1, lambda))
    		theta <- theta[1,]   	
	
    		cost<-costFunctionReg(theta, x1, y1, lambda)
    		error_train[i] <- cost    
		print(sprintf('training set cost: %f', cost)) 

    		cost<-costFunctionReg(theta, Xval, yval,lambda)
    		error_val[i] <- cost
  		print(sprintf('validation set cost: %f', cost))
		#print(cost)
		if(m - i < 1000){
			i <- i+20
			next
		}
		i<-i+1000
	}
  
  	list(error_train, error_val)

}