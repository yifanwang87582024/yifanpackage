## Linear Regression Function (R)
This repository contains an R function for performing Ordinary Least Squares (OLS) Linear Regression on a given dataset. The function calculates various regression statistics, including coefficient estimates, standard errors, t-values, R-squared, F-statistic, p-values, and confidence intervals.

## Function Overview
The linear_regression function fits a linear regression model to a dataset, estimating the relationship between a dependent variable and one or more independent variables. It returns a list of statistical outputs that are commonly used in regression analysis, making it suitable for both simple and multiple linear regression models.

## Function Name: 
`linear_regression`

The `linear regression` function from the `yifanpackage` has these parameters below:

data (data.frame): The dataset containing the dependent and independent variables.
depend_var (string): The name of the dependent (response) variable in data (as a string).
independ_vars (vector of strings): A vector of column names corresponding to the independent (predictor) variables in data.

## Purpose:
The `linear regression` function from the `yifanpackage` helps calculate the following statistical values:

Coefficients (Estimates): Estimated coefficients (betas) for each independent variable (including the intercept), which represent the relationship between the dependent variable and each independent variable in the model.
Standard Errors of Coefficients: The standard errors of the estimated coefficients, which provide an estimate of the variability in the coefficient estimates. Smaller standard errors suggest more precise estimates.
t-values for each coefficient: The t-values of the coefficients for hypothesis testing. These are calculated as the ratio of the estimated coefficient to its standard error. The t-value is used in hypothesis testing to determine if the coefficient is significantly different from zero.
Mean Squared Error (MSE): The Mean Squared Error (MSE) is a measure of the average squared difference between the observed actual outcomes and the predicted values. A lower MSE indicates a better-fitting model.
Residual Standard Error (RSE): The Residual Standard Error (RSE) is the square root of the MSE. It represents the standard deviation of the residuals (the differences between the observed and predicted values). It indicates how well the model fits the data.
R-squared (Coefficient of Determination): The R-squared value, also known as the coefficient of determination, measures the proportion of the variance in the dependent variable that is explained by the independent variables in the model. R-squared values range from 0 to 1, with higher values indicating better model fit.
F-statistic: The F-statistic is used to test the overall significance of the regression model. It compares the model with a model that has no predictors (i.e., intercept-only model). A larger F-statistic indicates that the model explains a significant portion of the variance in the dependent variable.
p-value: The p-value is associated with the F-statistic. It is used to test the null hypothesis that all regression coefficients are equal to zero. A smaller p-value (typically less than 0.05) indicates that at least one predictor variable is significantly related to the dependent variable.
Confidence Intervals for the coefficients: A matrix containing the 95% confidence intervals for each regression coefficient. The intervals provide a range of plausible values for the coefficients, based on the data. The lower and upper bounds of the intervals are calculated using the estimated coefficients and their standard errors.

## Installation
To ensure that the `yifanpackage` package can be installed without any issues, follow these installation instructions:

```r
# Check if the devtools package is installed and load it
install.packages("devtools")

# Install yifanpackage from GitHub
devtools::install_github("yifanwang87582024/yifanpackage")
```

## Function Usage
``` r
library(yifanpackage)
data = mtcars
model <- linear_regression(mtcars, "mpg", c("wt", "hp", "qsec"))
print(model)

$coefficients
            [,1]
     27.61052686
wt   -4.35879720
hp   -0.01782227
qsec  0.51083369

$standard_errors
                   wt         hp       qsec 
8.41992848 0.75270039 0.01498117 0.43922153 

$t_values
          [,1]
      3.279188
wt   -5.790879
hp   -1.189645
qsec  1.163043

$mean_square_error
[1] 6.644975

$residual_standard_error
[1] 2.577785

$r_squared
[1] 0.8347678

$f_value
[1] 47.15282

$p_value
[1] 4.506417e-11

$confidence_intervals
           [,1]        [,2]
     10.3630852 44.85796848
wt   -5.9006341 -2.81696034
hp   -0.0485098  0.01286526
qsec -0.3888708  1.41053822
```
## Details
The function implements Ordinary Least Squares (OLS) regression using matrix algebra.

The residuals are computed as the difference between the observed and predicted values of the dependent variable.

The Mean Squared Error (MSE) is used to compute the standard errors of the coefficients, which are then used to calculate t-values for hypothesis testing.

Confidence intervals are computed for the coefficients at a 95% confidence level.

## Assumptions
The function assumes that the input data does not contain missing values. It may need to be pre-processed (e.g., by removing or imputing missing data) before running the regression.

The function does not perform checks for multicollinearity, heteroscedasticity, or normality of residuals. You may want to check these assumptions manually or by using additional diagnostic tools.

## Limitations
The function assumes a linear relationship between the dependent and independent variables.

The function does not handle categorical variables (e.g., factor variables). These need to be pre-processed or converted to dummy variables before passing them into the function.

The function doesn't include regularization techniques (e.g., Ridge or Lasso regression).
