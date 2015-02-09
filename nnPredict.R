nnPredict<-function(Theta1, Theta2, X){
  
  m <- dim(X)[1]
  
  h1 <- sigmoid(X %*% t(Theta1)) # M x 26
  h2 <- sigmoid(cbind(numeric(m)+1, h1) %*% t(Theta2)) # M x 1
 
  pred<-h2 > 0.5
  pred
}