# Installing package
#install.packages("XML")
#library(XML)

# Loading particular files

fileUrL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrL,useInternal=TRUE) 
rootNode <- xmlRoot(doc)

# Extracting elements

rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[2]][[3]]

# Programatic extraction

# Extract all values

xmlSApply(rootNode,xmlValue)

# Extract all elements titled name

xpathSApply(rootNode,"//name",xmlValue)

# Extract all elements titled price

xpathSApply(rootNode,"//price",xmlValue)

