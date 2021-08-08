######################################################################################
######################################################################################
######################################################################################
#                          Buffon's Needle
#######################################################################################
######################################################################################
######################################################################################

# n = how many needles to throw
n <- 100

#choose positions of center of matchstick. Note the "board" is 5X10, vertical lines at every odd interger.
x.pos <- runif(n,0,10)
y.pos <- runif(n,0,5)
rotation <- runif(n,0,pi/2)

#figure out the x,y coords of the match endpoints using trig identities
x.max <- x.pos + 0.5*cos(rotation)
x.min <- x.pos - 0.5*cos(rotation)
y.max <- y.pos + 0.5*sin(rotation)
y.min <- y.pos - 0.5*sin(rotation)

#draw the board
plot(x=x.pos,y=y.pos,xlim=c(0,10),ylim=c(0,5),pch=".:",yaxt='n',xaxt='n',xlab=' ',ylab=' ')

#draw the lines
for (i in seq(1,9,2)){
  lines(c(i,i),c(0,5)) 
}

#draw the needles
segments(x.min,y.min,x.max,y.max)

#check to see how many cross each line
across <- 0
total <- 0
for (i in seq(1,9,by=2)){
  across <- sum(x.min < i & x.max > i)
  total = total + across
}
pi.estimate <- n/total

#color the crossing segments red, indicator is an indiactor variable
#for showing if the needle is crissing, where 0 = no and 1 = yes
#we will initially set it to 0 and change it to one on a case by case basis
#if the needle is crissing a line
indicator <- rep(0,n)
data <- data.frame(x.min,x.max,y.min,y.max,indicator)
for (j in 1:n){
  for (i in seq(1,9,2)){
    if (x.min[j] < i & x.max[j] > i) {data$indicator[j] <- 1}
  }
}
data.crossing <- data[which(data$indicator==1),]
segments(data.crossing$x.min,data.crossing$y.min,data.crossing$x.max,data.crossing$y.max,col="red")

#pi estimate is total thrown / number across -  calculate and display
paste("Pi estimate is ",pi.estimate,"Actual - estimate is",pi-pi.estimate)

######################################################################################
######################################################################################
#                                  end graphical illustration
#                                  begin bootstrap function
######################################################################################
######################################################################################



#The graphical component isn't necessary for the estimate (and neither is the Y component)
#So this procedure can easily be bootstrapped without them as follows

# define needed variables
n <- 1000
x.pos <- numeric(n)
x.max <- numeric(n)
rotation <- numeric(n)
across <- 0
total <- 0

#define the function
pi.est <- function(n){
  x.pos <- runif(n,0,10)
  rotation <- runif(n,0,pi/2)
  #figure out the x coords of the match endpoints
  x.max <- x.pos + 0.5*cos(rotation)
  x.min <- x.pos - 0.5*cos(rotation)
  #find how many sticks are across the lines
  for (i in seq(1,9,by=2)){
    across <- sum(x.min < i & x.max > i)
    total = total + across
  }
  pi.estimate <- n/total
}

#begin bootstrapping n=number of needles, b=number of bootstraps
b <- 1000
pi.estimates <- numeric(b)
for (i in 1:b){
  pi.estimates[i] <- pi.est(n)
}

#find mean and 95% confidence interval of the bootstrap
mean <- mean(pi.estimates)
c.int <- quantile(pi.estimates,c(0.025,0.975))

#round to 5 decimal places
mean <- round(mean,5)
c.int <- round(c.int,5)

#display the results
plot(density(pi.estimates),main=expression(widehat(pi)),yaxt = "n",ylab=' ')
abline(v=3.14159265359,col="blue")
abline(v=quantile(pi.estimates,c(0.025,0.975)),col="red")
paste("The mean estimate is ",mean,". The 95% confidence interval is from ",c.int[1]," and ",c.int[2])
