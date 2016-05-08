##############################################################################
# subscripting vectors                                                       #
##############################################################################

z <- rnorm(10,2,0.1)
z
# single value
z[5]
#sets of values
index <- c(3,6,8)
z[index]
z[seq(1:3)]
# ommiting third value
z[-3]
# ommitting 2nd, 5th and 9th value
index2 <- c(-2,-5,-9)
z[index2]
# logical indexing every number greater than 2
z[z>2]
# who many are less than or equal to 2
length(z[z<=2])
# finding the subscripts
which(z<=2.001)

##############################################################################
# subscripting matrices                                                      #
##############################################################################

mat <- matrix(data <- seq(1:12),nrow = 3,ncol=4)
mat
# same index by row first then column
mat[3,2]
# can also use vectors for indexing
mat[3,c(1,4)]
#indexing the 1st first row
mat[1,]
#indexing the 3rd column
mat[,3]

##############################################################################
# subscripting dataframes with subset (can be used with matrices too)        #
##############################################################################

id <-seq(1:10)
length <- rnorm(10,3,0.2)
width <- rnorm(10,2,0.1)
cabins <- data.frame(id,length,width)
subset(cabins,length>3,select=c("width"))

##############################################################################
# subscripting dataframes with %in% and subset and %in%                      #
##############################################################################

id <-seq(1:10)
length <- rnorm(10,3,0.2)
width <- rnorm(10,2,0.1)
cabins <- data.frame(id,length,width)
cabins$id %in% c(1,2)
cabins[cabins$id %in% c(1,2),]
subset(cabins,cabins$id %in% c(3,5),select=c("length","id"))







