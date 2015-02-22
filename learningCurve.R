learningCurve<-function(X, y, Xval, yval,lambda){
	# Number of training examples
  m <-dim(X)[1]
  
	d = 100 # record the training error every 100 examples
  
  # return these values correctly
  numRecords = m/100
  error_train <-numeric(numRecords)
  error_val <-numeric(numRecords)

	n <- dim(X)[2]
  i <- 1000 # training starts at the 1000 th example
  while(i <= numRecords){
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
		if(m - i < d){
			i <- m
			next
		}
		i<-i+d
	}
  
  list(error_train, error_val)

}