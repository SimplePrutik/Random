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

Pi_LCG <- function (seed, length)
{
	f <- gl(length, 2)
	length <- length * 2
	res <- c()
	A <- 23456757
	C <- 54678657
	M <- 2^32
	while (length != 0)
	{
		seed <- (A * seed + C) %% M
		t <- seed / M
		res <- c(res,t)
		length <- length - 1
	}
	x <- tapply(res, f, sum2)
	P <- length(x[x < 1])/length(x)*4
	P

}
