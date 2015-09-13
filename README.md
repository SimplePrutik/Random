#Random numbers
The aim was to compare three random generators with power of language R: its native algorithm of uniform distribution (Mersenne-twister), linear congruential generator, linear feedback shift register. I used Monte-Carlo method for this. I created functions generating random points witch amount set by parameter of function, counting their amount inside a circle and total, dividing first by second and muiltiplying result by 4.

#Results
Accuracy: 100000 points.

Seed for LCG and LFSR: 1234567890

1. R Uniform (Mersenne-twister): 3.14620;  
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
3. Write in R console 

  **setwd(***[path to directory with downloaded functions]***)**
  
4. Write in R console string by string: 

  **source("uniform.R")**
  
  **source("LCG.R")**
  
  **source("LFSR.R")**

5. At last write: 
  
  **c("Uniform" = Pi_unif(100000), "LCG" = Pi_LCG(100000), "LFSR" = Pi_LFSR(100000))**

Compiling with accuracy 100000 will take about 9 minutes. As result you will see a chart with three named columns with appropriate result for each one.


##Conclusion

R Uniform distribution (Mersenne-twister) took 1st place, LFSR - vice-champion, LCG - consolation prize


#Visualization of Monte-Carlo method

You need to download special packages for visualization. Write in R console (for Windows):

**install.packages("playwith", lib="c:/Users/***username***/Documents/R/win-library/3.2/")**

**install.packages("animation", lib="c:/Users/***username***/Documents/R/win-library/3.2/")**

If you use not Windows just download these packages somehow :)

After this write following:

  **source("uniform.R")**

  **source("LCG.R")**
  
  **source("LFSR.R")**

Now all required functions are available continue:

  **playwith()**
  
Write down in input line:

**Mersenne_Twister(***[accuracy]***,***[interval]***)** for inbuilt Mersenne Twister generator

**LCG(***[accuracy]***,***[interval]***)** for LCG generator

**LFSR(***[accuracy]***,***[interval]***)** for LFSR generator

Field *interval* means amount of points appearing in our graph, obviously field *accuracy* means accuracy of our test.

