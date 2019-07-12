library(MASS)
#install.packages("ISLR")
library(ISLR)

names(Boston)

attach(Boston)
lm.fit <- lm(medv~lstat)
summary(lm.fit)
confint(lm.fit)
predict(lm.fit,data.frame(lstat=c(5,10,15)), interval="confidence")

jpeg("fig2.jpg")
plot(lstat,medv)
abline(lm.fit)

lm.fit <- lm(medv~lstat+age)
summary(lm.fit)

# shorthand for fitting to all variables
lm.fit <- lm(medv ~ .-age, data=Boston)
summary(lm.fit)

# include nonlinear transformations
lm.fit2 <- lm(medv ~ lstat+I(lstat^2))

lm.fit <- lm(medv ~ lstat)
anova(lm.fit, lm.fit2)
