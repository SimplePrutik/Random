#function of value squaring
square <- function(x) 	#x - value
{
  	x*x
}

#supportng function for Monte-Carlo method
sum2 <- function (...)
{
	sqrt(sum(square(...)))	#did point hit the cicle or not
}

#function of increasing matrix
add <- function (x, amount, func)	#x - matrix, amount - value of increasing, func - algorithm of generator
{
	y <- matrix(func(amount * 2, 0, 1), amount, 2)				#generating of matrix	
	z <- cbind(y, floor(y[,1] * y[,1] + y[,2] * y[,2]) + 1)		#binding column meaning did point hit the circle or not
	rbind(x,z)													#binding with original matrix
}

