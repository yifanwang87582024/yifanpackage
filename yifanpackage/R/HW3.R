#'linear_regression function
#'
#'This function helps to calculate the relative statistical values of linear regression.
#'
#'@param data dataset. This input value is any dataset including several variables.
#'@param depend_var dependent variable. A variable would like to measure,
#'which depends on the independent variable.
#'@param independ_vars independent variable. A variable in a model used to forecast
#'the outcome of dependent variable based on its value.
#'
#'@return a list of relative statistical values of linear regression through calculation.
#'
#'@examples
#'linear_regression(mtcars, "mpg", c("wt", "hp", "qsec"))
#'
#'@export
#'
linear_regression = function(data, depend_var, independ_vars) {
  return(list(
    coefficients = betas,
    standard_errors = se_betas,
    t_values = t_values,
    mean_square_error = mse,
    residual_standard_error = rse,
    r_squared = r_squared,
    f_value = f_value,
    p_value = p_value,
    confidence_intervals = conf_intervals
  ))
}

linear_regression <- function(data, depend_var, independ_vars) {
  y <- data[[depend_var]] # Response variable
  x <- data[independ_vars] # Extract predictors as data frame
  X <- data.matrix(x) # Convert to numeric matrix
  new_X <- cbind(1, X)

  XtX_inv <- solve(t(new_X) %*% new_X)
  betas <- XtX_inv %*% t(new_X) %*% y # Estimation of coefficients
  y_predicted <- new_X %*% betas
  residuals <- y - y_predicted

  n <- length(y)
  p <- length(betas)

  mse <- sum(residuals**2)/(n-p) # Mean square error
  se_betas <- sqrt(mse*diag(XtX_inv)) # Standard errors of coefficients
  t_values <- betas/se_betas # t-values of coefficients
  rse <- sqrt(mse) # Residual standard error

  ss_total <- sum((y - mean(y))**2)
  ss_residual <- sum(residuals**2)
  ss_regression <- sum((y_predicted - mean(y))**2)
  r_squared <- ss_regression/ss_total # Coefficient of determination

  ms_regression <- ss_regression/(p-1)
  ms_residual <- mse
  f_value <- ms_regression/ms_residual # F statistics
  p_value <- 1 - pf(f_value, df1 = p-1, df2 = n-p) # P-value
  crit_value <- qt(0.975, df = n - p)
  conf_intervals <- cbind(betas - crit_value*se_betas, betas + crit_value*se_betas) # Confidence intervals

  return(list(
    coefficients = betas,
    standard_errors = se_betas,
    t_values = t_values,
    mean_square_error = mse,
    residual_standard_error = rse,
    r_squared = r_squared,
    f_value = f_value,
    p_value = p_value,
    confidence_intervals = conf_intervals
  ))
}
