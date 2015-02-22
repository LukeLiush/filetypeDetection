learningCurveNN<-function(hidsize, X, y, Xval, yval,lambda){
	# Number of training examples
  m <-dim(X)[1]
  
	d = 200 # record the training error every 100 examples
  mm = d
  # return these values correctly
  numRecords = ceiling((m-mm)/d)
  error_train <-numeric(numRecords)
  error_val <-numeric(numRecords)

	n <- dim(X)[2]
  i <- 1 
  while(i <= numRecords){
  	x1 <- data.matrix(X[1:mm,])
   	y1 <- data.matrix(y[1:mm])
   	print(dim(x1))

   	results <- trainNN(hisize=hidsize, X=x1, y=y1, lambda=lambda)
   	theta <- coef(results)
   	theta <- theta[1,]   	
		print(sprintf('At loop [%d/%d], Training time taken with %f', i, numRecords, results$xtimes))
   	cost<-nnCostFunction(nn_params=theta, hidden_layer_size=hidsize, X=x1, y=y1, lambda=lambda)
   	error_train[i] <- cost    
		print(sprintf('  -  training set cost: %f', cost)) 

   	cost<-nnCostFunction(nn_params=theta, hidden_layer_size=hidsize, X=Xval, y=yval, lambda=lambda)
   	error_val[i] <- cost
   	
  	print(sprintf('  -  validation set cost: %f', cost))
		#print(cost)
		i<-i+1
   	mm <- mm + d
	}
  
  list(error_train, error_val)

}