##############################################################################
# apply() - perform a calculation on each row, column or element of a matrix #
##############################################################################

elements <- rep(seq(1,3),4)
elements
mat <- matrix(elements,nrow=3)
mat
add_one <- function(x){return(x + 1)}
apply(mat,1,sum)  # arguement 1 means apply to rows
apply(mat,2,sum)  # arguement 2 means apply to columns
apply(mat,c(1,2),add_one)  # arguement c(1,2) means apply to each element
apply(mat,c(1,2),function(x) x + 2) # function defined in apply call

#################################################################################
# lapply() - perform a calculation on each object in a list and return a list   #
# sapply() - perform a calculation on each object in a list and return a vector #
#################################################################################

# as a data frame is an example of a list, work with a data frame
# Setting up data frame
weight <- rnorm(10, mean = 80, sd = 5)
height <- rnorm(10, mean = 170, sd = 10)
waist <- rnorm(10, mean = 75, sd = 5)
measurements <- data.frame(weight,height,waist)
average_measures_list <- lapply(measurements,mean)
average_measures_list
class(average_measures_list)
average_measures_vector <- sapply(measurements,mean)
average_measures_vector
class(average_measures_vector)
# Note lapply and sapply can also be used for sublists
# Useful if we have a variable for which we don't want
# to apply the function to. E.g.
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
measurements <- data.frame(gender,weight,height,waist)
# without subsetting
average_measures_list <- lapply(measurements,mean)
average_measures_list
# with subsetting
average_measures_list <- lapply(measurements[2:3],mean)
average_measures_list
average_measures_vector <- sapply(measurements[2:3],mean)
average_measures_vector

#################################################################################
# tapply() - apply a function to a vector for each group as defined by another  #
# factor vector                                                                 #
#################################################################################

weight <- rnorm(10, mean = 80, sd = 5)
height <- rnorm(10, mean = 170, sd = 10)
waist <- rnorm(10, mean = 75, sd = 5)
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
test_group <- as.factor(c(rep(1,2),rep(2,2),rep(3,2),rep(4,2),rep(5,2)))
measurements <- data.frame(test_group,gender,weight,height,waist)
# using tapply with one factor
meas_mean <- tapply(measurements$weight,measurements$gender,mean)
# using tapply with two factors
new_meas_mean <- tapply(measurements$weight,list(measurements$gender,measurements$test_group),mean)
new_meas_mean

#################################################################################
# by() - similar to tapply except can be applied to a whole data frame rather a #
# vector, by outputs a list                                                     #
#################################################################################

weight <- rnorm(10, mean = 80, sd = 5)
height <- rnorm(10, mean = 170, sd = 10)
waist <- rnorm(10, mean = 75, sd = 5)
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
test_group <- as.factor(c(rep(1,2),rep(2,2),rep(3,2),rep(4,2),rep(5,2)))
measurements <- data.frame(test_group,gender,weight,height,waist)
# Using by with one factor variable
meas_mean <- by(measurements[3:5],measurements$gender,colMeans)
# Using by with two factor variables
new_meas_mean <- by(measurements[3:5],
                    list(measurements$gender,measurements$test_group),
                    colMeans)

#################################################################################
# aggregate() - similar to by except can be applied to a whole data frame       #
# rather vector and outputs a whole data frame                                  #
#################################################################################

weight <- rnorm(10, mean = 80, sd = 5)
height <- rnorm(10, mean = 170, sd = 10)
waist <- rnorm(10, mean = 75, sd = 5)
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
test_group <- as.factor(c(rep(1,2),rep(2,2),rep(3,2),rep(4,2),rep(5,2)))
measurements <- data.frame(test_group,gender,weight,height,waist)
measurements
# Using aggregate with one factor variable
meas_mean <- aggregate(measurements[3:5],
                       list(gender = measurements$gender),
                       mean)
meas_mean
# Using aggregate with two factor variables
new_meas_mean <- aggregate(measurements[3:5],
                           list(gender = measurements$gender,
                                group = measurements$test_group),
                           mean)
new_meas_mean

#################################################################################
# merge() - merges two data frames based on a common column                     #
#################################################################################

weight <- rnorm(10, mean = 80, sd = 5)
height <- rnorm(10, mean = 170, sd = 10)
waist <- rnorm(10, mean = 75, sd = 5)
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
test_group <- as.factor(c(rep(1,2),rep(2,2),rep(3,2),rep(4,2),rep(5,2)))
whments <- data.frame(test_group,gender,weight,height)
whments
wments <- data.frame(test_group,gender,waist)
wments
measurements <-merge(whments,wments)
measurements
# merging when common column has a different name
weight <- rnorm(10, mean = 80, sd = 5)
height <- rnorm(10, mean = 170, sd = 10)
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
test_group <- as.factor(c(rep(1,2),rep(2,2),rep(3,2),rep(4,2),rep(5,2)))
whments <- data.frame(test_group,gender,weight,height)
whments
waist <- rnorm(10, mean = 75, sd = 5)
genders <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
test_groups <- as.factor(c(rep(1,2),rep(2,2),rep(3,2),rep(4,2),rep(5,2)))
wments <- data.frame(test_groups,genders,waist)
wments
measurements <-merge(whments,wments,by.x = "gender",by.y = "genders")
measurements

