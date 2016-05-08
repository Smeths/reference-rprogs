##############################################################################
# basic vector operations                                                    #
##############################################################################

# ways of creating vectors

x <- seq(1,11,2)
x
y = c(2,4,6,8,10,12)
y
z = c(1,0)
z

# operations on vectors

x*y
x/y
# note how z wraps
x*z

# applying a function to a vector applies the function to each element

log(x)

##############################################################################
# basic matrix operations                                                    #
##############################################################################

# creating a matrix (filling up column first)

matc <- matrix(data = seq(1,12),
              nrow=3,
              ncol=4,
              dimnames= list(c("r1","r2","r3"),c("c1","c2","c3","c4")))
matc

# creating a matrix (filling up row first)

matr <- matrix(data = seq(1,12),
               nrow=3,
               ncol=4,
               byrow = TRUE,
               dimnames= list(c("r1","r2","r3"),c("c1","c2","c3","c4")))
matr

# simple matrix operations

matc + matr
matc + 3
matr/2


