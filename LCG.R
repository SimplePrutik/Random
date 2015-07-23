square <- function(x)
{
	x*x
}

sum2 <- function (...)
{
	sqrt(sum(square(...)))
}

# ^ function which find point location ^

Pi_LCG <- function (seed, length)
{
	f <- gl(length, 2)
	length <- length * 2
	res <- c()		
	A <- 23456757				#
	C <- 54678657				#
	M <- 2^32				#constants	
	while (length != 0)
	{
		seed <- (A * seed + C) %% M	#algorithm step
		t <- seed / M			#computing value
		res <- c(res,t)			#adding to coordinates vector 
		length <- length - 1		
	}
	x <- tapply(res, f, sum2)		#applying of function 
	length(x[x < 1])/length(x)*4		#computing of Pi
}
