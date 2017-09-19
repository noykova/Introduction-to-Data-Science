#Read the Titanic train preprocessed data from provided exercise 
#solution code
#train - training data

library(dplyr)

titanic <- read.csv(file="testOut.csv",header=TRUE,sep=",")
keep <- c("Survived", "Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Cabin", "Embarked")
titanic <- select(titanic, one_of(keep))

glimpse(titanic)
colnames(titanic)
dim(titanic)
str(titanic)
summary(titanic)
head(titanic)

#The first part of the code is in Python, Exercise_1_Week_2. 

#read survivorJane
SurvivorJane <- read.csv(file="SurvivorJane.csv",header=TRUE,sep=",")
#remove PassingerID
#remove Sex and Survived
keep1 <- c("Pclass", "Age", "SibSp", "Parch", "Fare", "Cabin", "Embarked")
SurvivorJane <- select(SurvivorJane, one_of(keep1))
dim(SurvivorJane)
summary(SurvivorJane)

#read nonsurvivor Joe
NonSurvivorJoe <- read.csv(file="NonSurvivorJoe.csv",header=TRUE,sep=",")
#remove PassingerID
#remove Sex and Survived
NonSurvivorJoe <- select(NonSurvivorJoe, one_of(keep1))
dim(NonSurvivorJoe)
summary(NonSurvivorJoe)

library(GGally)
library(ggplot2)

#Transform back sex to categorical in order to display it graphycally.
titanic$Sex <- as.factor(titanic$Sex)
titanic$Survived <- as.factor(titanic$Survived)
pTitanic <- ggpairs(titanic, mapping = aes(col=Sex, alpha=0.3), lower = list(combo = wrap("facethist", bins = 20)))
pTitanic

#another presentation of correlation matrix
titanic$Sex <- as.numeric(titanic$Sex)
titanic$Survived <- as.numeric(titanic$Survived)
cor_matrix<-cor(titanic) %>% round(digits =2)
cor_matrix
library(corrplot)
corrplot(cor_matrix, method="circle", type = "upper", cl.pos = "b", tl.pos = "d", tl.cex = 0.6)

SurvivorJane$Embarked <- as.factor(SurvivorJane$Embarked)
#SurvivorJane$Sex <- as.factor(SurvivorJane$Sex)
#SurvivorJane$Survived <- as.factor(SurvivorJane$Survived)
pJane <- ggpairs(SurvivorJane, mapping = aes(col=Embarked, alpha=0.3), lower = list(combo = wrap("facethist", bins = 20)))
pJane

#another presentation of correlation matrix
SurvivorJane$Embarked <- as.numeric(SurvivorJane$Embarked)
cor_matrix<-cor(SurvivorJane) %>% round(digits =2)
cor_matrix
corrplot(cor_matrix, method="circle", type = "upper", cl.pos = "b", tl.pos = "d", tl.cex = 0.6)


NonSurvivorJoe$Embarked <- as.factor(NonSurvivorJoe$Embarked)
#NonSurvivorJoe$Sex <- as.factor(NonSurvivorJoe$Sex)
#NonSurvivorJoe$Survived <- as.factor(NonSurvivorJoe$Survived)
pJoe <- ggpairs(NonSurvivorJoe, mapping = aes(col=Embarked, alpha=0.3), lower = list(combo = wrap("facethist", bins = 20)))
pJoe
