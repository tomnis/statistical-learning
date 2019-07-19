library(ISLR)
dim(Smarket)
cor(Smarket[,-9])
attach(Smarket)
glm.fits=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume , data=Smarket ,family=binomial)
summary(glm.fits)



glm.probs=predict(glm.fits,type="response")
glm.probs[1:10]

glm.pred=rep("Down",1250)
glm.pred[glm.probs >.5]="Up"
table(glm.pred,Direction)
mean(glm.pred==Direction )

train=(Year <2005)
Smarket.2005 = Smarket [! train ,]
dim(Smarket.2005)
Direction.2005=Direction[!train]

glm.fits=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume , data=Smarket ,family=binomial,subset=train)
glm.probs=predict(glm.fits,Smarket.2005,type="response")

glm.pred=rep("Down",252)
glm.pred[glm.probs >.5]="Up"
mean(glm.pred==Direction.2005)
mean(glm.pred!=Direction.2005)

glm.fits=glm(Direction~Lag1+Lag2,data=Smarket ,family=binomial, subset=train)
glm.probs=predict(glm.fits,Smarket.2005,type="response")
glm.pred=rep("Down",252)
glm.pred[glm.probs >.5]="Up"
mean(glm.pred==Direction.2005)
predict(glm.fits,newdata=data.frame(Lag1=c(1.2,1.5), Lag2=c(1.1,-0.8)),type="response")


library(MASS)
lda.fit=lda(Direction~Lag1+Lag2,data=Smarket ,subset=train)
lda.fit
lda.pred=predict(lda.fit, Smarket.2005)
lda.class=lda.pred$class
mean(lda.class==Direction.2005)

sum(lda.pred$posterior[,1]>=.5)
sum(lda.pred$posterior[,1]<.5)
lda.pred$posterior[1:20,1]
sum(lda.pred$posterior[,1]>.9)


qda.fit=qda(Direction~Lag1+Lag2,data=Smarket ,subset=train)
qda.fit
qda.class=predict(qda.fit,Smarket.2005)$class
mean(qda.class==Direction.2005)

library(class)
train.X=cbind(Lag1 ,Lag2)[train ,]
test.X=cbind(Lag1,Lag2)[!train,]
train.Direction =Direction [train]
set.seed(1)
knn.pred=knn(train.X,test.X,train.Direction ,k=1)
table(knn.pred,Direction.2005)
knn.pred=knn(train.X,test.X,train.Direction ,k=3)
table(knn.pred,Direction.2005)
mean(knn.pred==Direction.2005)


dim(Caravan)
attach(Caravan)
# unit variance, mean zero
standardized.X=scale(Caravan [,-86])

test =1:1000
train.X=standardized.X[-test ,]
test.X=standardized.X[test ,]
train.Y=Purchase [-test]
test.Y=Purchase [test]
set.seed (1)
knn.pred=knn(train.X,test.X,train.Y,k=1)
mean(test.Y!=knn.pred)
mean(test.Y!="No")

knn.pred=knn(train.X,test.X,train.Y,k=3)
table(knn.pred,test.Y)
knn.pred=knn(train.X,test.X,train.Y,k=5)
table(knn.pred,test.Y)
