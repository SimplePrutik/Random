source("uniform.R")
source("LCG.R")
source("LFSR.R")
source("rqrd_func.R")

N <- 10000

print(c("Uniform" = Pi_unif(N), "LCG" = Pi_LCG(N), "LFSR" = Pi_LFSR(N)))
