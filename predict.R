predict<-function(theta, X){
	y = sigmoid(X %*% theta)
	y>0.5	
}