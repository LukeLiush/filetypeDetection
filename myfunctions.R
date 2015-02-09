readfreqplot <- function(file, typ='l'){
	x<-read.table(file)
	frq <- x[,1]
	frq <- frq/max(frq)
	frq <- sqrt(frq)
	plot(frq, type=typ)
}
readbarplot <- function(file1){
	x<-read.table(file1)
	h<-x[,1]
	hf<-h/max(h)
	#hf<-alaw(hf)
	hf<-sqrt(hf)
	#hf<-alawInverse(hf)
	barplot(hf, names.arg=0:255)
}

alaw <- function(x, A=87.7){
	th = 1/A
	cond1 <- (x>=0 && x < th)
	cond2 <- (x>=th && x <= 1)
	x[cond1] <- A * abs(x[cond1]) / (1+log(A))
	x[cond2] <- sign(x[cond2])*(1+log(A*abs(x[cond2])))/(1+log(A))
	x
}

alawInverse <- function(y, A=87.7){
	th = 1/(1+log(A))
	cond1 <- y<th
	cond2 <- y>=th & y<=1
	y[cond1] = abs(y[cond1])*(1+log(A))/A
	y[cond2] = (exp(abs(y[cond2])*(1+log(A)))-1)/A
	y
}

hcor <- function(file){
	yy<-read.table(file)[,1]
	yy<-yy/max(yy)
	xx<-0:255
	cor(x=xx, y=yy)
}

hsummary <- function(file){
	xx<-read.table(file)[,1]
	xx<-xx/max(xx)
	yy<-c(summary(xx),IQR(xx), hcor(file))
	
	yy
}

