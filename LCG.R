#required functions
source("rqrd_func.R")

#constants for LCG-algorithm
A <- 23456757
C <- 54678657
M <- 2^32

#function which create vector of random numbers with LCG
rLCG <- function (n, min = 0, max = 1, seed = as.numeric(Sys.time()))	#n - size of vector, min(max) - minimum(maximum) of generating numbers, seed - number which algorithm begin with
{
	result <- c()					#empty vector
	for (i in 1:n)
	{
		seed <- (A * seed + C) %% M		#step of algorithm
		t <- seed / M * (max - min) + min	#generating of number
		result <- c(result, t)			#pushback to vector
	}
	result
}

#Monte-Carlo method
Pi_LCG <- function (length, seed = as.numeric(Sys.time()))	#length - accuracy of test, seed - number which algorithm begin with
{
	f <- gl(length, 2)				#supporting array
	res <- rLCG(length*2, 0, 1)			#array of random points	
	x <- tapply(res, f, sum2)			#computing of amount of points
	length(x[x < 1])/length(x)*4			#computing of Pi
}

#function for graph
LCG <- function (acc, interval, seed = as.numeric(Sys.time()))	#acc - accuracy of test, interval - interval between frames, seed - number which algorithm begin with
{
	library(playwith)				#
	library(animation)				#supporting libraries
	m <- matrix(,0,3)				#empty matrix	
	ani.options(interval = 0.1)			#interval between frames
	while(nrow(m) < acc)				#loop of frames
	{
		m <- add(m, interval, rLCG)		#enlarging of matrix
		plot(m[,1],m[,2], col=m[,3], cex = 0.3, xlab = "", ylab = "")	#calling of graph 
		panel.text(paste("Pi: ", round(sum((m[,3] - 2) * (-1)) / nrow(m) * 4, digits = 4)), x = 140, y = 40)	#output current Pi
		panel.text(paste("Accuracy: ", nrow(m)), x = 300, y = 40)	#output current accuracy	
		ani.pause();				#pause between frames
	}
}
