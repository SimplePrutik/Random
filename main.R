source("uniform.R")
source("LCG.R")
source("LFSR.R")

N <- 10000

print(c("Uniform" = Pi_unif(N), "LCG" = Pi_LCG(1234567890, N), "LFSR" = Pi_LFSR(1234567890, N)))
