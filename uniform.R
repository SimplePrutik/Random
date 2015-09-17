#required functions
source("rqrd_func.R")

# function for graph
# acc - accuracy of test
# interval - interval between frames
Mersenne_Twister <- function (acc, interval)
{
    Graph(acc, interval, runif)        #runif - function with inbuilt generator of random numbers
}

