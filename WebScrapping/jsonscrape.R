#installing packages
install.packages("jsonlite")
library(jsonlite)
# Data retrieved as a list
jsonData <- fromJSON("https://api.github.com/users/Smeths") 
jsonData[1]
jsonData$following
jsonData$updated_at
