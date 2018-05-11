---
title: "Power simulations"
author: "Benjamin Chan (chanb@ohsu.edu)"
date: 2018-05-11
output: html_document
---



## Generate data



Study design is a two-factor, full factorial randomization.
The factors are **framing** and the **message** of the intervention.
Each factor has **3** levels.

Full sample size is **N = 600**.

Number of simulations is **S = 1000**.

The outcomes are **comprehension** and **influence**.



Comprehension is a dichotomous outcome.
Baseline comprehension is assumed to be **50%**.

Influence is a continuous outcome.
It represents pre-post change on a scale.
For analytic purposes, it will be scaled on a (-1, +1) continuum.
Baseline influence is assumed to be **0.00**.

![plot of chunk generateData](../figures/generateData-1.png)![plot of chunk generateData](../figures/generateData-2.png)

|framing |message |    n| meanComprehension| nominalRiskRatio| nominalRiskDiff| meanInfluence| meanSD| meanCV| nominalEffectSize|
|:-------|:-------|----:|-----------------:|----------------:|---------------:|-------------:|------:|------:|-----------------:|
|A       |X       | 1000|             0.502|            1.000|           0.000|         0.000|  0.538| 49.494|              0.00|
|A       |Y       | 1000|             0.646|            1.291|           0.146|         0.155|  0.528|  1.660|              0.54|
|A       |Z       | 1000|             0.669|            1.336|           0.168|         0.178|  0.522|  2.556|              0.62|
|B       |X       | 1000|             0.633|            1.268|           0.134|         0.144|  0.528|  5.231|              0.50|
|B       |Y       | 1000|             0.760|            1.519|           0.260|         0.286|  0.498|  1.854|              1.04|
|B       |Z       | 1000|             0.776|            1.555|           0.277|         0.306|  0.492|  1.698|              1.12|
|C       |X       | 1000|             0.660|            1.314|           0.158|         0.163|  0.527|  4.012|              0.58|
|C       |Y       | 1000|             0.779|            1.555|           0.278|         0.308|  0.492|  1.683|              1.12|
|C       |Z       | 1000|             0.793|            1.588|           0.294|         0.325|  0.485|  1.570|              1.20|

![plot of chunk generateData](../figures/generateData-3.png)![plot of chunk generateData](../figures/generateData-4.png)![plot of chunk generateData](../figures/generateData-5.png)

## Aim 1: Comprehension


|term     | samples| truePos| power| sampleSize|
|:--------|-------:|-------:|-----:|----------:|
|framingB |    1000|     715| 0.715|        600|
|framingC |    1000|     840| 0.840|        600|
|messageY |    1000|     809| 0.809|        600|
|messageZ |    1000|     891| 0.891|        600|

![plot of chunk comprehension](../figures/comprehension-1.png)


## Aim 2: Influence


|term     | samples| truePos| power|
|:--------|-------:|-------:|-----:|
|framingB |    1000|     736| 0.736|
|framingC |    1000|     846| 0.846|
|messageY |    1000|     816| 0.816|
|messageZ |    1000|     900| 0.900|

![plot of chunk influence](../figures/influence-1.png)


## Session summary


```
## $completionDateTime
## [1] "2018-05-11 14:53:24 PDT"
## 
## $executionTime
## Time difference of 56.77568 secs
## 
## $sessionInfo
## R version 3.4.3 (2017-11-30)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 7 x64 (build 7601) Service Pack 1
## 
## Matrix products: default
## 
## locale:
## [1] LC_COLLATE=English_United States.1252 
## [2] LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252
## [4] LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] parallel  stats     graphics  grDevices utils     datasets  methods  
## [8] base     
## 
## other attached packages:
##  [1] bindrcpp_0.2.2    truncnorm_1.0-8   ggplot2_2.2.1    
##  [4] doParallel_1.0.11 iterators_1.0.9   foreach_1.4.4    
##  [7] broom_0.4.4       dplyr_0.7.4       magrittr_1.5     
## [10] rmarkdown_1.8     knitr_1.17        checkpoint_0.4.2 
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.16     highr_0.6        pillar_1.2.1     compiler_3.4.3  
##  [5] plyr_1.8.4       bindr_0.1.1      tools_3.4.3      digest_0.6.12   
##  [9] evaluate_0.10.1  tibble_1.4.2     nlme_3.1-131     gtable_0.2.0    
## [13] lattice_0.20-35  pkgconfig_2.0.1  rlang_0.2.0      psych_1.8.3.3   
## [17] stringr_1.2.0    rprojroot_1.2    grid_3.4.3       glue_1.2.0      
## [21] R6_2.2.2         foreign_0.8-69   tidyr_0.8.0      purrr_0.2.4     
## [25] reshape2_1.4.3   backports_1.1.1  scales_0.5.0     codetools_0.2-15
## [29] htmltools_0.3.6  assertthat_0.2.0 mnormt_1.5-5     colorspace_1.3-2
## [33] labeling_0.3     stringi_1.1.5    lazyeval_0.2.1   munsell_0.4.3
```
