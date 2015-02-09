gradFunctionReg<-function(theta, X, y, lambda){
	m<-dim(X)[1]
	n<-dim(X)[2]

	h<-sigmoid(X %*% theta)
	grad <- numeric(n)
	grad[1] <- 1/m * (t(h-y) %*% X[,1])
	
	grad[2:n] <- 1/m * (t(X[,2:n]) %*% (h-y)) + lambda/m * theta[2:n]
	grad
}