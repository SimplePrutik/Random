#Auxiliary functions

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

--------------------------------------------------------------------
#Uniform distribution

Pi <- function (acc)

{

	x <- runif(acc * 2, 0, 1)
	f <- gl(acc, 2)
	x <- tapply(x, f, sum2)
	P <- length(x[x < 1])/length(x)*4
	P 
}

--------------------------------------------------------------------
#Linear congruential generator

LCG <- function (seed, length)

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

--------------------------------------------------------------------
#Linear feedback shift register

LFSR <- function(seed, amount)

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

--------------------------------------------------------------------
#Results

##Accuracy - 100000 points in Monte Carlo method's square

Uniform  - 3.14620

LCG - 3.16496

LFSR - 3.12580
