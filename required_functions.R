#function of value squaring
square <- function(x)     #x - value
{
    x*x
}

#supportng function for Monte-Carlo method
sum2 <- function (...)
{
    sqrt(sum(square(...)))    #did point hit the cicle or not
}

# Monte-Carlo method
# accuracy - amount of points
# func - function of random generator
# seed - number which algorithm begin with
Pi <- function (accuracy, func, seed = as.numeric(Sys.time()))
{
    f <- gl(length, 2)                     #supporting factor
    res <- func(length*2, 0, 1)            #vector of random points    
    x <- tapply(res, f, sum2)              #computing of amount of points
    length(x[x < 1])/length(x)*4           #computing of Pi
}

#function of enlarging matrix
# x - matrix
# amount - value of enlarging
# func - algorithm of generator
# resulting matrix - m[n,3] -> m[n + amount, 3]
add <- function (x, amount, func)    
{
    y <- matrix(func(amount * 2, 0, 1), amount, 2)                #generating of matrix    
    z <- cbind(y, floor(y[,1] * y[,1] + y[,2] * y[,2]) + 1)       #binding column meaning did point hit the circle or not
    rbind(x,z)                                                    #binding with original matrix
}

# function for graph
# acc - accuracy
# interval - interval between frames
# func - function required for current algorithm
Graph <- function (acc, interval, func)       
{
    library(playwith)                #    
    library(animation)               #supporting libraries
    m <- matrix(,0,3)                #empty matrix
    ani.options(interval = 0.1)      #setting interval between frames
    while(nrow(m) < acc)             #loop of frames
    {
        m <- add(m, interval, func)        #enlarging of matrix
        plot(m[,1],m[,2], col=m[,3], cex = 0.3, xlab = "", ylab = "")    #calling of graph 
        panel.text(paste("Pi: ", round(sum((m[,3] - 2) * (-1)) / nrow(m) * 4, digits = 4)), x = 140, y = 40)    #output current Pi
        panel.text(paste("Accuracy: ", nrow(m)), x = 300, y = 40)    #output current accuracy    
        ani.pause();                #pause between frames
    }
}
