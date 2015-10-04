#required functions
source("../required_functions.R")

#constants for LCG-algorithm
A <- 23456757
C <- 54678657
M <- 2^32

# function which create vector of random numbers with LCG
# n - size of vector
# min(max) - minimum(maximum) of generating numbers
rLCG <- function (n, min = 0, max = 1)
{
    seed <- as.numeric(Sys.time()) 
    result <- c()                    #empty vector
    for (i in 1:n)
    {
        seed <- (A * seed + C) %% M        #step of algorithm
        t <- seed / M * (max - min) + min  #generating of number
        result <- c(result, t)             #pushback to vector
    }
    result
}

#function for graph
# acc - accuracy of test
# interval - interval between frames
LCG <- function (acc, interval)
{
    Graph(acc, interval, rLCG)
}

web_LCG <- function (amount)
{
    web_Graph(rLCG, amount)
}
