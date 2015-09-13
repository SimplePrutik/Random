source("rqrd_func.R")

#Monte-Carlo method
Pi_unif <- function (acc)			#acc - accuracy of test
{
	x <- runif(acc * 2, 0, 1)		#array of random points
	f <- gl(acc, 2)				#supporting array
	x <- tapply(x, f, sum2)			#computing of amount of points
	length(x[x < 1])/length(x)*4		#computing of Pi
}

#function of increasing amount of points
add <- function (x, amount)						#x - matrix, amount - number of increasing
{
	y <- matrix(runif(amount * 2, 0, 1), amount, 2)			#creating of matrix
	z <- cbind(y, floor(y[,1] * y[,1] + y[,2] * y[,2]) + 1)		#creating of column meaning hit the circle for future functions
	rbind(x,z)							#binding with original matrix
}

#function for graph
Mersenne_Twister <- function (acc, interval)
{
	library(playwith)				#	
	library(animation)				#supporting libraries
	m <- matrix(,0,3)				#empty matrix
	ani.options(interval = 0.1)			#interval between frames
	while(nrow(m) < acc)				#loop of frames
	{
		m <- add(m, interval)			#enlarging of matrix
		plot(m[,1],m[,2], col=m[,3], cex = 0.3, xlab = "", ylab = "")	#calling of graph 
		panel.text(paste("Pi: ", round(sum((m[,3] - 2) * (-1)) / nrow(m) * 4, digits = 4)), x = 140, y = 40)	#output current Pi
		panel.text(paste("Accuracy: ", nrow(m)), x = 300, y = 40)	#output current accuracy	
		ani.pause();				#pause between frames
	}
}

