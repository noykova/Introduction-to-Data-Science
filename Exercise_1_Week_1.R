#Read the Titanic train data from Kuggle
#train - training data

library(dplyr)
titanic <- read.csv(file="train.csv",header=TRUE,sep=",",na.strings=c(""," ","NA"))

# 1. look at the dimension, structure and column names of the data 
#195 observations of 8 variables
dim(titanic)
str(titanic)
colnames(titanic)
summary(titanic)
head(titanic)



# 2. columns to keep
keep <- c("PassengerId", "Survived", "Pclass", "Sex", "Age", "Ticket", "Fare", "Cabin")

# select the 'keep' columns
tit <- select(titanic, one_of(keep))

glimpse(tit)

#3. take only the first character from the column Cabin
tit$Cab <- substr(tit$Cabin, 0, 1)
glimpse(tit)

#4.	Transform string to categorical column values.
tit$Cab <- as.factor(tit$Cab)
glimpse(tit)

#5.a For continous values, replace the missing values 
#with the average of the non-missing values of that column.

#mean is calculated by taking the sum of the values and 
#dividing with the number of values in a data series.

#The middle most value in a data series is called the median

#The next ifelse() function returns the imputed mean value 
#if its first argument is NA. Otherwise, it returns the first argument.

tit$Age <- ifelse(is.na(tit$Age), mean(tit$Age, na.rm=TRUE), tit$Age)
glimpse(tit)

#5.b For discrete and categorical values, replace the missing values 
#with the mode of the column.

#The mode is the value that has highest number of occurrences in a set 
#of data. Unike mean and median, mode can have both numeric 
#and character data

library(Hmisc)
tit$Cabin <- impute(tit$Cabin, mean)
tit$Cab <- impute(tit$Cab, mean)
glimpse(tit)

# 6.1 export data as *csv file.
write.csv(tit, file = "titCsv.csv")
#6.2 convert titCsv.csv to titJson.json

library(rjson)
titJson <- toJSON(unname(split(tit, 1:nrow(tit))))
cat(titJson)












