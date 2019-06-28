x <- c(1,2,3)
length(x)
y <- c(4,5,6)
x + y

ls()
rm(list=ls())

# ?matrix


x <- matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x

# standard normal random variables
x <- rnorm(50)
y <- rnorm(50, mean=50, sd=.1)
cor(x,y)

# reproducible
set.seed(1337)

mean(x)
jpeg("fig1.jpg")
plot(x,y)


x <- 1:10
y <- x
f <- outer(x, y, function(x, y) cos(y) / (1 + x ^ 2))
contour(x, y, f)
contour(x, y, f, nlevels=45, add=T)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels=16)
image(x, y, fa)
persp(x, y, fa, theta=30, phi=40)

A <- matrix(1:16, 4, 4)
A
A[2, 3]
A[1:3, 2:4]
A[-c(1,3),]
dim(A)

#Auto <- read.table("/data/Auto.data", header=T, na.strings="?")
Auto <- read.csv("/data/Auto.csv", header=T, na.strings="?")
dim(Auto)
names(Auto)

plot(Auto$cylinders, Auto$mpg)
# alternatively:
# attach(Auto)
# plot(cylinders, mpg)

attach(Auto)
# treat it as qualitative
cylinders <- as.factor(cylinders)
plot(cylinders, mpg, varwidth=T)

hist(mpg)

# scatterplot matrix
pairs(Auto)

summary(Auto)
