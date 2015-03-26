rm(list=ls())
source('loadAndProcess.R')
source('trainLinearReg.R')
source('sigmoid.R')
source('costFunctionReg.R')
source('gradFunctionReg.R')
source('predict.R')
source('learningCurveNN.R')

source('trainNN.R')
source('nnCostFunction.R')
source('nnGradFunction.R')
source('sigmoidGradient.R')
source('nnPredict.R')
source('randInitWeights.R')

source('checkNNGradients.R')
source('debugInitializeWeights.R')
source('computeNumericalGradient.R')
source('myfunctions.R')
library(optimx)

##############################
#load and preprocess training#
# validation, and test data	 #
##############################
dataset <- loadAndProcess(tnpath='train1.hist', vpath='val.hist', tspath='test.hist')
X <- dataset[[1]]
y <- dataset[[2]]
Xval <- dataset[[3]]
yval <- dataset[[4]]
Xtest <- dataset[[5]]
ytest <- dataset[[6]]

m <- dim(X)[1]
n <- dim(X)[2]

# reduce the size of training set
X <- X[0:m,]
y <- y[0:m]

hidden_layer_size <- 2
lambda <- 0

##############################
# gradient checking	##########
# disable it when training ###
##############################
#checkNNGradients(lambda)



##############################
# training linear regression #
##############################
#theta<-trainLinearReg(X, y, lambda)
#theta<-coef(theta)[1]
#p <- predict(theta, Xval)
#print(sprintf('Accuracy: %f', mean((p == yval)) * 100))

###############################
#[nn] training neural networks#
###############################
hidSize<-hidden_layer_size
result<-trainNN(hidSize, X, y, lambda)


#[nn] Obtain Theta1 and Theta2 back from nn_params
nn_params <- t(coef(result))
print(sprintf('The time taken for training: %f', result$xtimes))
print(sprintf('The training error cost: %f', result$value))
valcost <- nnCostFunction(nn_params, hidSize, Xval, yval, lambda)
testcost <- nnCostFunction(nn_params, hidSize, Xtest, ytest, lambda)
print(sprintf('The validation error cost: %f', valcost))
print(sprintf('The testing error cost: %f', testcost))

#print(result$convcode)
n1 <- n * hidSize
Theta1 <- matrix(nn_params[1:n1], nrow=hidSize, ncol=n)
n2 <- length(nn_params)
Theta2 <- matrix(nn_params[n1+1:n2], nrow=1, ncol=hidSize+1)


pred <- nnPredict(Theta1, Theta2, X)
print(sprintf('Training Accuracy: %f', mean((pred == y)) * 100))
pred <- nnPredict(Theta1, Theta2, Xval)
print(sprintf('Validation Accuracy: %f', mean((pred == yval)) * 100))
pred <- nnPredict(Theta1, Theta2, Xtest)
print(sprintf('Testing Accuracy: %f', mean((pred == ytest)) * 100))

##############################
###### learning curve ########
##############################
#valres <- learningCurveNN(hidSize, X=X, y=y, Xval=Xval, yval=yval,lambda=lambda)



#save(file='valres_200.learningcurve', valres)
#print('saving the result list - valres: done!')

#vm = length(valres[[1]])
#xx <- c(2:vm)
#yyt <- valres[[1]][2:vm]
#yyv <- valres[[2]][2:vm]

#plot(xx, yyt, xlim=range(xx), ylim=range(yyt, yyv), type='l')
#plot(xx, yyt, xlim=range(xx), ylim=range(c(0,1), c(0, 2)), type='l')

#lines(xx,yyv, col='blue')


#output the model
exportNNParams(outputfile='tika.model',nn_params, 256, hidden_layer_size, 1, testcost)

