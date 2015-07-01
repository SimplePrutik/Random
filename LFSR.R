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

Pi_LFSR <- function(seed, amount)
{
	res <- c()
	g <- gl(amount, 2)
	x <- intToBits(seed)
	amount <- amount * 62
	z <- c()
	while (amount != 0)
	{
		z <- c(z,x[1])
		y <- (x[1] == x[4])
		seed <- bitwShiftR(seed, 1) + (2^30) * as.numeric(y)
		x <- intToBits(seed)
		if (length(z) == 31)
		{
			z <- c(z, 0)
			k <- as.raw(z)
			k <- packBits(k, "integer")
			res <- c(res, k / (2^31 - 1))
			z <- c()
		}
		amount <- amount - 1
	}
	x <- tapply(res, g, sum2)
	P <- length(x[x < 1])/length(x)*4
	P

}
