test_that("linear regression works", {
  expect_equal(linear_regression(mtcars, "mpg", c("wt", "hp", "qsec")), list(
    coefficients = list(27.61053, -4.35880, -0.01782, 0.51083),
    standard_errors = c(8.41993, 0.75270, 0.01498, 0.43922),
    t_values = list(3.279, -5.791, -1.190, 1.163),
    mean_square_error = 6.645,
    residual_standard_error = 2.578,
    r_squared = 0.8348,
    f_value = 47.15,
    p_value = 4.506e-11,
    confidence_intervals = c(c(10.3630852, 44.85796848),
                             c(-5.9006341, -2.81696034),
                             c(-0.0485098, 0.01286526),
                             c(-0.3888708, 1.41053822))
  ))
})
