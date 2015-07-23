square <- function(x)
{
	x*x
}

sum2 <- function (...)
{
	sqrt(sum(square(...)))
}

# ^ function which find point location ^

Pi_unif <- function (acc)
{
	x <- runif(acc * 2, 0, 1)		#generation of vector with random values
	f <- gl(acc, 2)
	x <- tapply(x, f, sum2)			#applying of function	
	length(x[x < 1])/length(x)*4		#computing of Pi
}

# Mersenne-Twister used
