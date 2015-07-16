square <- function(x)
{
	x*x
}

sum2 <- function (...)
{
	result <- sum(square(...))
	sqrt(result)
}

Pi_unif <- function (acc)
{
	x <- runif(acc * 2, 0, 1)
	f <- gl(acc, 2)
	x <- tapply(x, f, sum2)
	length(x[x < 1])/length(x)*4
}

