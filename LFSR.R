#required functions
source("required_functions.R")


# function which create vector of random numbers with LFSR
# n - size of vector
# min(max) - minimum(maximum) of generating numbers
rLFSR <- function(n, min = 0, max = 1)    
{
    result <- c()                    #empty vector
    for (i in 1:n)
    {
        z <- 0                    
        for (j in 0:30)
        {
            seed <- bitwShiftR(seed, 1) + (2^30)*(as.logical(bitwAnd(seed, 1)) == as.logical(bitwAnd(seed, 2^3)))    #step of algorithm
            z <- z + (2^j)*bitwAnd(seed, 1)        #computing of each bit of generating number
        }
        result <- c(result, z/(2^31)*(max - min) + min)    #computing of number
    }    
    result    
}


# function for graph
# acc - accuracy of test
# interval - interval between frames
LFSR <- function (acc, interval)
{
    Graph(acc, interval, rLFSR)
}
