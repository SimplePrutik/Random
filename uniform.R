square <- function(x)
{
	y <- x*x
	y
}

sum2 <- function (...)
{
	result <- sum(square(...))
	result <- sqrt(result)	
	result
}

Pi_unif <- function (acc)
{
	x <- runif(acc * 2, 0, 1)
	f <- gl(acc, 2)
	x <- tapply(x, f, sum2)
	P <- length(x[x < 1])/length(x)*4
	P 
}
