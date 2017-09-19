#read the .json file

library(rjson)


# Give the input file name to the function.
result <- fromJSON(file = "Automotive_5.json")
print(result)
#It seems that the reading did not succeed, 
#and only the first json object was read. 


#useful library for json objects: tidyjson. 
#link: https://cran.r-project.org/web/packages/tidyjson/vignettes/introduction-to-tidyjson.html

textBeg<-result[['reviewText']]
textBeg <- result$reviewText
textBeg


#change to lower case and remove punctuation
textBeg = tolower(textBeg) #make it lower case
textBeg
textBeg = gsub('[[:punct:]]', '', textBeg) #remove punctuation
textBeg


#remove stop-words
library(tm)
stopwords_regex = paste(stopwords('en'), collapse = '\\b|\\b')
stopwords_regex = paste0('\\b', stopwords_regex, '\\b')
textBeg = stringr::str_replace_all(textBeg, stopwords_regex, '')
textBeg

(result)
