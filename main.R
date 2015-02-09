rm(list=ls())
source('loadAndProcess.R')
source('trainLinearReg.R')
source('sigmoid.R')
source('costFunctionReg.R')
source('gradFunctionReg.R')
source('predict.R')
source('learningCurve.R')

source('trainNN.R')
source('nnCostFunction.R')
source('nnGradFunction.R')
source('sigmoidGradient.R')
source('nnPredict.R')
library(optimx)


#load and preprocess training, validation, and test data
dataset <- loadAndProcess(tnpath='train1.hist', vpath='val.hist', tspath='test.hist')
X <- dataset[[1]]
y <- dataset[[2]]
Xval <- dataset[[3]]
yval <- dataset[[4]]
Xtest <- dataset[[5]]
ytest <- dataset[[6]]

m <- dim(X)[1]
n <- dim(X)[2]

# training linear regression
lambda <- 1
#theta<-trainLinearReg(X, y, lambda)
#theta<-coef(theta)[1]
#p <- predict(theta, Xval)
#print(sprintf('Accuracy: %f', mean((p == yval)) * 100))


#[nn] training neural networks
hidSize <- 5
result<-trainNN(hidSize, X[], y[], lambda)


#[nn] Obtain Theta1 and Theta2 back from nn_params
nn_params <- t(coef(result))
print(result$xtimes)
print(result$values)
print(result$convcode)
n1 <- n * hidSize
Theta1 <- matrix(nn_params[1:n1], nrow=hidSize, ncol=n)
n2 <- length(nn_params)
Theta2 <- matrix(nn_params[n1+1:n2], nrow=1, ncol=hidSize+1)

pred <- nnPredict(Theta1, Theta2, X)
print(sprintf('Accuracy: %f', mean((pred == y)) * 100))

##############################
###### learning curve ########
##############################
#valres <- learningCurve(X=X, y=y, Xval=Xval, yval=yval,lambda=lambda)

#xx <- c(2:m)
#yyt <- valres[[1]][2:m]
#yyv <- valres[[2]][2:m]

#plot(xx, yyt, xlim=range(xx), ylim=range(yyt, yyv), type='l')
#plot(xx, yyt, xlim=range(xx), ylim=range(c(0,1), c(0, 2)), type='l')

#lines(xx,yyv, col='blue')




