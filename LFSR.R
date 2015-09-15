#required functions
source("rqrd_func.R")


#function which create vector of random numbers with LFSR
rLFSR <- function(n, min = 0, max = 1, seed = as.numeric(Sys.time()))	#n - size of vector, min(max) - minimum(maximum) of generating numbers, seed - number which algorithm begin with
{
	result <- c()					#empty vector
	for (i in 1:n)
	{
		z <- 0					
		for (j in 0:30)
		{
			seed <- bitwShiftR(seed, 1) + (2^30)*(as.logical(bitwAnd(seed, 1)) == as.logical(bitwAnd(seed, 2^3)))	#step of algorithm
			z <- z + (2^j)*bitwAnd(seed, 1)		#computing of each bit of generating number
		}
		result <- c(result, z/(2^31)*(max - min) + min)	#computing of number
	}	
	result	
}

#Monte-Carlo method
Pi_LFSR <- function(amount, seed = as.numeric(Sys.time()))	#amount - accuracy of test, seed - number which algorithm begin with
{
	g <- gl(amount, 2)			#supporting array
	res <- rLFSR(amount * 2, 0, 1)		#array of random points	
	x <- tapply(res, g, sum2)		#computing of amount of points
	length(x[x < 1])/length(x)*4		#computing of Pi
}

#function for graph
LFSR <- function (acc, interval)	#acc - accuracy of test, interval - interval between frames
{
	Graph(acc, interval, rLFSR)
}
