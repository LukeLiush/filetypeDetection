debugInitializeWeights <- function(fan_out, fan_in){
	
	# Initialize W using "sin", this ensures that W is always of the same
	# values and will be useful for debugging
	W <- sin(matrix(1:(fan_out*fan_in), nrow=fan_out, ncol=fan_in)) * 0.1
	W
}