source("uniform.R")
source("LCG.R")
source("LFSR.R")

N <- 10000
seed <- 1234567890

print(c("Uniform" = Pi_unif(N), "LCG" = Pi_LCG(seed, N), "LFSR" = Pi_LFSR(seed, N)))
