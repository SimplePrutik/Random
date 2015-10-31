source("required_functions.R")

# function for graph
# acc - accuracy of test
# interval - interval between frames
Mersenne_Twister <- function (acc, interval)
{
    # runif - built-in generator of random numbers based on Mersenne Twister:
    Graph(acc, interval, runif)
}

