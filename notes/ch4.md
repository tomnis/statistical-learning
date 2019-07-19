# classification

linear regression is not appropriate
- we don't want to imply any ordering of outcomes

## logistic regression
we must model p(X) with a function with codomain [0, 1]
logistic function:

p(X) = (e ^ (B0 + B1 * X)) / (1 + e ^(B0 + B1 * X))

fit using max likelihood


odds = p(X) / (1 - p(X)) = e ^ (B0 + B1 * X)

max likelihood:
- seek estimates for B0 and B1 such that predicted probabilities
  are close to observed probabilities


likelihood function:
reduce(mult)(p(xi)) * reduce(mult)(1 - p(xi))


### multiple logistic regression

p(X) = (e ^ (B0 + B1 * X1 + B2 * X2 ...) / (1 + e ^ (B0 + B1 * X1 + B2 * X2 ...))


## linear discriminant analysis

- model distribution of predictors X separately in each response class, use Bayes to flip
  Pr(Y = k | X - x)

- parameter estimates of logistic regression are unstable when classes are well-separated
- logreg can be unstable when n in small and predictors have normal distribution
- lda is better for > 2 response classes

πk = prior probability of belonging to class k
fk(x) = density function = Pr(X = x | Y = k)

Pr(Y = k | X = x) = (πk * fk(x)) / sum(l)(πl * fl(x))

compute decision boundary

### extend lda for p > 1

- assume X is drawn from multi-variate gaussian distribution
X ~ N(mu, Sigma)
Sigma = p x p covariance matrix

δk(x) = xT * (Σ −1 μ  * k) − 0.5μ Tk Σ -1 μk + log π k

only 3% of individuals defaulted; null classifier performs very well

goal: approximate bayes classifier

need to use domain knowledeg to choose threshold

area under ROC -- upper left is good

## quadratic discriminant analysis

- assume each class has its own covariance matrix
- much more flexible, but many more parameters to estimate
- LDA tends to be better if there are few training observations


## etc

- logreg and LDA both produce linear decision boundaries, use different fitting procedures
- KNN is nonparametric, makes no assumptions about the shape of decision boundary
- however, KNN does not tell us which predictors are important
- QDA is a compromise between KNN and linear approaces. 
- use the "adding synthetic parameters" trick to move between LDA and QDA
