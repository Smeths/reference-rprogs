# Installing package
install.packages("XML")
library(XML)
fileURL <- "http://www.bbc.co.uk/news/technology/"
doc <- htmlTreeParse(fileURL,useInternal=TRUE)
teams1 <- xpathSApply(doc,"//div",xmlValue)
teams2 <- xpathSApply(doc,"//div[@class='data-table']",xmlValue)
