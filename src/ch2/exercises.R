college <- read.csv("/data/College.csv", header=T, na.strings="?")
dim(college)
rownames(college) <- college[,1]
college <- college[,-1]
attach(college)
jpeg("fig1.jpg")
pairs(college[,1:10])

# treat as qualitative
#Outstate <- as.factor(Outstate)
Private <- as.factor(Private)
plot(Private, Outstate, varwidth=T)

# bin Top10perc
Elite <- rep("No", nrow(college))
Elite[Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
college <- data.frame(college, Elite)
plot(Elite, Outstate, varwidth=T)
