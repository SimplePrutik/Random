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
	Graph(acc, interval, rLCG)
}
