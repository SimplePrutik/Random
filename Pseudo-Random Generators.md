#Random numbers
The aim was to compare three random generators with power of language R: uniform distribution, linear congruential generator, linear feedback shift register. I used Monte-Carlo method for this. I created functions generating random points witch amount set by parameter of function, counting their amount inside a circle and total, dividing first by second and muiltiplying result by 4.

#Results
Accuracy: 100000 points.

Seed for LCG and LFSR: 1234567890

1. Uniform: 3.14620;  
  Difference with Pi ≈ 0.0046
2. LCG: 3.16496;  
  Difference with Pi ≈ 0.0233
3. LFSR: 3.12580;  
  Difference with Pi ≈ 0.0157

Compilation took ~9.1 minutes.

#Recreating
To recreate these experiment you should make following steps:

1. Download, install and run R.
2. Download scripts with functions.
3. Click *File* in upper menu, then *Change dir...* and choose directory with downloaded functions.
4. Write in R console string by string: 

**source("uniform.R")**
  
**source("LCG.R")**
  
**source("LFSR.R")**
5. At last write: 
  
**c("Uniform" = Pi_unif(100000), "LCG" = Pi_LCG(1234567890, 100000), "LFSR" = Pi_LFSR(1234567890, 100000))**
