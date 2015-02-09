sigmoidGradient<-function(z){
  g <- sigmoid(z)
  g <- g *(1-g);
  g
}