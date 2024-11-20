## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(yifanpackage)

## -----------------------------------------------------------------------------
linear_regression(mtcars, "mpg", c("wt", "hp", "qsec"))

