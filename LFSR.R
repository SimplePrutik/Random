square <- function(x)
{
	x*x
}

sum2 <- function (...)
{
	sqrt(sum(square(...)))
}

Pi_LFSR <- function(seed, amount)
{
	res <- c()
	g <- gl(amount, 2)
	amount <- amount * 62
	z <- 0
	a <- 0
	while (amount != 0)
	{
		z <- z + (2^a)*bitwAnd(seed, 1) 					#charging of value
		a <- a + 1
		y <- as.logical(bitwAnd(seed, 1)) == as.logical(bitwAnd(seed, 2^3))	#polynomial x^31 + x^28
		seed <- bitwShiftR(seed, 1) + (2^30)*y					#shift and computing of new number
		if (a == 31)
		{
			res <- c(res, z/(2^31))
			a <- 0
			z <- 0
		}
		amount <- amount - 1
	}
	x <- tapply(res, g, sum2)
	length(x[x < 1])/length(x)*4
}
