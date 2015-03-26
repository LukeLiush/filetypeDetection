randInitWeights <- function(n){
	epsilon_init <- 0.12
	w <- runif(n, -epsilon_init, epsilon_init)
	w
}
