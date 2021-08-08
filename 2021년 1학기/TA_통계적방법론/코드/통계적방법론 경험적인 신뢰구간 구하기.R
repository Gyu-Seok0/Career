set.seed(125)
n <- 50 # n = 5, 10, 15, 30, 50
m <- 10000 # m = 1000, 10000
v = 49 # variance 4, 49
count = 0
sdu <- sqrt(v/n)
se <- 1.96*sdu
for(i in 1:m){
  xbar <- rnorm(1, 0, sd = sdu)
  if(abs(xbar - 0) < se){
    count = count+1
  }
}
count/m


set.seed(1000)
n <- 50
m <- 10000
p = 0.8 # 0.1, 0.2, 0.5, 0.8, 0.9
count = 0 
#sdu <- sqrt(p*(1-p)/n)
sdu <- sqrt(n*p*(1-p))/n
se <- 1.96*sdu
for(i in 1:m){
  xi = rbinom(n, size = 1, prob = p) # 이항분포로 베르누이 시행의 평균을 구한듯하다.
  phat = mean(xi)
  if(abs(p-phat) < se){
    count = count+1
  }
}
count/m

sdu


xi



set.seed(1000)
n = 300
m = 10000
a = 0
b = 1
ex = (b-a)/2 # a~bø°º≠ n∞≥
count = 0
sdu <- sqrt((b-a)^2/(12*n))

se <- 1.96*sdu
for(i in 1:m){
  xbar <- mean(runif(n, min = a, max = b))
  if(abs(xbar-ex) < se){
    count = count+1
  }
}
count/m

#이항분포에서 구하기
n <- 300
m <- 10000
p <- 0.5
ex <- n*p
sd <- sqrt(n*p*(1-p)/n)
cnt <- 0
for (i in 1:m){
  xbar <- mean(rbinom(n,size = n, prob = p))
  z_value <- (xbar - ex)/sd
  if (abs(z_value) <= 1.96){
    cnt = cnt +1  
  }
}
cnt/m

fit <- lm(mpg ~ gear, data = mtcars)
summary(fit)
anova(fit)
