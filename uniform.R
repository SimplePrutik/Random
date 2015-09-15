#required functions
source("rqrd_func.R")

#Monte-Carlo method
Pi_unif <- function (acc)			#acc - accuracy of test
{
	x <- runif(acc * 2, 0, 1)		#array of random points
	f <- gl(acc, 2)				#supporting array
	x <- tapply(x, f, sum2)			#computing of amount of points
	length(x[x < 1])/length(x)*4		#computing of Pi
}

#function for graph
Mersenne_Twister <- function (acc, interval)	#acc - accuracy of test, interval - interval between frames
{
	Graph(acc, interval, runif)		#runif - function with inbuilt generator of random numbers
}

