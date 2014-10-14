# README

This is the beginnings of an R packages that implements the ideas in my
paper on dealing with separation in logit models. You can find pdf of the working draft of that paper [here](http://www.carlislerainey.com/papers/separation.pdf) and the GitHub repository for the paper [here](https://github.com/carlislerainey/priors-for-separation).

`separation` requires the latest version of `compactr`, and both of these packages are available on GitHub.


```r
devtools::install_github("carlislerainey/compactr")
devtools::install_github("carlislerainey/separation")
```

The idea is simple. In order to draw meaningful inferences when facing separation, you must choose an informative prior. This can be tricky with logistic regression models, because the coefficients are not on a scale that many researchers are comfortable with. To facilitate choose a reasonable, informative prior, researchers might focus on the partial prior predictive distribution, explained in the paper linked to above. The partial prior distribution allows researchers to focus on the usual quantities of interest, such as predicted probabilities, first-differences, and risk-ratios. Researchers can use this package to what prior distributions for the coefficients imply about the partial prior preditive distribution, which is easier to make sense of.

We can first calculate and summarize the PPPD for an "informative" prior distribution.


```r
# load package
library(separation)

# load data
data(politics_and_need)

# simulate from potential priors
normal_1 <- rnorm(10000, sd = 1)
normal_2 <- rnorm(10000, sd = 2)
normal_4 <- rnorm(10000, sd = 4)

# model formula
f <- oppose_expansion ~ gop_governor + percent_favorable_aca + percent_uninsured

# informative prior
pppd_inf <- calc_pppd(f, data = politics_and_need, prior_sims = normal_2,     
                   sep_var_name = "gop_governor", prior_label = "Normal(0, 2)")

# summarize the pppd from the informative prior
print(pppd_inf)
```

```
## 
## Model:	oppose_expansion ~ gop_governor + percent_favorable_aca + percent_uninsured
## Prior for gop_governor:	Normal(0, 2)
## 
##    percentile	predicted probability	first-difference	risk-ratio	
##    1%		0.005			0.006			1.014			
##    5%		0.014			0.028			1.071			
##    25%		0.069			0.14			1.483			
##    50%		0.166			0.262			2.58			
##    75%		0.289			0.359			6.17			
##    95%		0.4			0.414			29.71			
##    99%		0.422			0.424			89.29			
```

```r
plot(pppd_inf)
```

![plot of chunk inf](inf.png) 

We might also like to compare that to a "skeptical" and "enthusiastic prior"" distribution.


```r
# enthusiastic and skeptical prior
pppd_enth <- calc_pppd(f, data = politics_and_need, prior_sims = normal_4, 
                   sep_var_name = "gop_governor", prior_label = "Normal(0, 4)")
pppd_skep <- calc_pppd(f, data = politics_and_need, prior_sims = normal_1, 
                   sep_var_name = "gop_governor", prior_label = "Normal(0, 1)")
pppds <- combine_pppd(pppd_skep, pppd_inf, pppd_enth)

# plot all pppds for comparisons
plot(pppds)
```

![plot of chunk eth_skep](eth_skep.png) 
