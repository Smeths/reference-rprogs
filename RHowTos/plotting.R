###############################################################################
# The Base Plotting System                                                    #
###############################################################################

# Creating a dataframe

id <- as.factor(seq(1:10))
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
length <- rnorm(10,3,0.2)
width <- rnorm(10,2,0.1)
height <- rnorm(10,4,0.4)

cabins <- data.frame(id,gender,length,width,height)

# basic plot method

plot(cabins$length,cabins$width)

# alternatively

with(cabins,plot(length,width, xlab = "Cabin Length", ylab = "Cabin Width"))

# plotting options

title(main = "Cabin Size")
points(length,width,col = "blue", pch = 20)

# Making multiple plots mfrow fills rol first use mfcol to fill column first
# note the outer margin (oma) has been enlarged so that the title for all
# plots fits with no problem

par(mfrow = c(2,2),oma = c(0,0,2,0))
with(cabins, {
  plot(height,width, main="title 1")
  plot(height,length, main="title 2")
  plot(length,width, main="title 3")
  plot(height,width, main="title 4")
  mtext("title for all plots",outer = TRUE)
})

###############################################################################
# The Lattice Plotting System                                                 #
###############################################################################

# general syntax
# xyplot(y ~ x | f * g, data)
# where y is the y axis x is the x axis f and g are conditioning variables 
# (optional) and data is the data frame

# unlike the base plotting system you cannot make a plot and build upon
# it. Everything has to be done in one command.

# Creating a dataframe

id <- as.factor(c(rep(1,5),rep(2,5)))
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
length <- rnorm(10,3,0.2)
width <- rnorm(10,2,0.1)
height <- rnorm(10,4,0.4)

cabins <- data.frame(id,gender,length,width,height)

# loading the lattice library

library(lattice)
xyplot(length~width,data=cabins)

# examples with conditioning factor variables

xyplot(length~width|gender,data=cabins)
xyplot(length~width|gender*id,data=cabins)

# The base graphics system plot directly to the "graphics device"
# however the lattice plotting system returns an object of class
# "trellis" the print method needs to be used to send the object
# to the graphics device. (above this is done implicitly). E.g.

p <- xyplot(height~width|gender*id,data=cabins)
print(p)

# Lattice panel functions. As with the above example lattice
# use factors to produce a number of panels and a plot in each
# we can add panel function to include addition features such 
# as regression lines etc to each panel

xyplot(length~width|gender*id,
       data=cabins,
       panel=function(x,y, ...)
         {
            panel.xyplot(x, y, ...) # default panel function
            panel.lmline(x, y, col=2) # include a regression line
            panel.grid(4,4,col=2) # include a grid
       })

###############################################################################
# ggplot2 plotting system                                                     #
###############################################################################

# ggplot2 is an implementation of the grammar of graphics
# plots are made up of aesthetics (size shape color) and 
# geoms points, lines 

# Creating a dataframe

id <- as.factor(c(rep(1,5),rep(2,5)))
gender <- as.factor(c(rep("F",5),rep("M",2),rep("F",3)))
length <- rnorm(10,3,0.2)
width <- rnorm(10,2,0.1)
height <- rnorm(10,4,0.4)

cabins <- data.frame(id,gender,length,width,height)

# qplot is an implementation of ggplot, which is quick
# to learn and use, however you cannot change the defaults
# very easily. Basic usage is qplot(xdata,ydata,data=dataframe)
# e.g.

library(ggplot2)
qplot(length,width,data=cabins)

# factors can also be included

qplot(length,width,data=cabins,color=gender)

# or using the facets arguement to produce multiple plots

qplot(length,width,data=cabins,facets=.~gender)

# similarly a set of histograms aligned vertically

qplot(length,data=cabins,facets=gender~.)

# using 2 factors

qplot(length,width,data=cabins,facets=id~gender)

# including a "geom" 

qplot(length,width,data=cabins,geom = c("point","smooth"))

# using the ggplot2 package is a little like using the base system
# in that plots are built up. 

# first the dataframe and data to be plotted are given. The data
# to be plotted is thought of as aesthetics

g <- ggplot(cabins,aes(length,width))
summary(g)

# a geom must be specified before using the print command to plot

g <- g + geom_point(color = "steelblue")
print(g)

# other geoms can be added 

g <- g + geom_smooth(method="lm")
print(g)

# factors can also be used

g <- g + facet_grid(id~gender)
print(g)

# interesting plot that changes vline per faucet, needs some preliminary code
data("mtcars")
mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("Automatic", "Manual")
mean(subset(mtcars,am=="Automatic",select=c("mpg"))$mpg)
mean(subset(mtcars,am=="Manual",select=c("mpg"))$mpg)
tranmeans <- data.frame(am    = c("Automatic","Manual"),
                        means = c(mean(subset(mtcars,am=="Automatic",select=c("mpg"))$mpg),
                                  mean(subset(mtcars,am=="Manual",select=c("mpg"))$mpg)))
library(ggplot2)
g <- ggplot(mtcars,aes(mpg))
g <- g + geom_histogram(fill="red",binwidth=1)
g <- g + geom_vline(data = tranmeans, aes(xintercept = means),size=1.5)
g <- g + facet_grid(am~.)
g <- g + ggtitle("Manual and Automatic Transmission Comparison")
g <- g + xlab("Miles Per Gallon")
g <- g + ylab("Count")
g

