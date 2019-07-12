# linear regression

## simple linear regression:
Y ~= B0 + B1 * X

yhat = B0hat + B1hat * x

most common, minimize least squares

ei = yi - yhat
   = yi - B0hat + B1hat * xi
residual sum of squares = e1^2 + e2^2 + ... en^2


B1hat = sum(1..n, (xi - mean(x))(yi - mean(y))) / sum(1..n, (xi - mean(x)) ^ 2)
B0hat = mean(y) - B1hat * mean(x)

population regression line (true relationship) vs least squares line (our estimate)

if we estimate β0 and β1 on the basis of a particular data set, then our estimates won’t be exactly equal to β0 and β1. But if we could average the estimates obtained over a huge number of data sets, then the average of these estimates would be spot on! 

standard error
Var(μˆ) = SE(μˆ) = σ^2 / n

residual standard error = RSE = sqrt(rss / (n - 2))

95% confidence interval
βˆ1 ± 2 · SE(βˆ1)

standard error can be used to perform hypothesis test
H0: β1 = 0
Ha: β1 != 0


t-statistic: number of std devs that B1hat is away from 0

t = (βˆ1 − 0) / SE(βˆ1)

rse is a measure of _lack of fit_ (measured in units of Y)

R^2 statistic:
proportion of variance explained (independent of scale of Y)

R^2 = (TSS - RSS) / TSS = 1 - (RSS / TSS)
TSS total sum of squares = 􏰂(yi − y ̄)2



## multiple linear regression

Y = β0 + β1X1 + β2X2 + ··· + βpXp + ε
same approach, minimize RSS

hypothesis test
H0: β1 = β2 = ··· = βp = 0
Ha: at least one βj is non-zero.

determine with f-statistic
for p predictors:
F = ((TSS - RSS) / p) / (RSS / (n - p - 1))

how to select which subset of p predictors is most useful? 2^p models

forward selection:
- start with empty model, fit p different simple linear regs, add variable with lowest RSS
  continue adding variables until satisfied

backward selection (cannot be used if p > n):
- start with all variables, remove variable with largest p-value
  continue until a stopping rule, eg all variables p-value below threshold

mixed selection
- start with empty model, add variable with best fit, remove any variables with high p-values

add dummy variables to simulate qualitative predictors

add interaction term
Y = β0 + β1X1 + β2X2 + β3X1X2 + ε

add nonlinear terms
mpg = β0 + β1 × horsepower + β2 × horsepower^2 + ε

assumption: error terms are uncorrelated
assumption: error terms have constant variance

collinearity results in growth of SE
check VIF (variance inflation factor) for collinearity

## k nearest neighbors regression

non-parametric, does not assume a parametric form for f(X)

given K, x0:
  find K training observations that are closest to x0
