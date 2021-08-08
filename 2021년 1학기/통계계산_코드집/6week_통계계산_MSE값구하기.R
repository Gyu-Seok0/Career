simulation <- 1000

y_mean <- NULL
y_median <- NULL
y_trim_mean <- NULL

n <- 10
k <- 0.2 # 자르고 싶은 percentage
trim <- n*k

for (i in 1: simulation){
  # 표본추출
  x1<- rnorm(9,mean = 0, sd = 1)
  x2 <- rnorm(1, mean = 5, sd= 16)
  x <- c(x1,x2)
  
  # estimator 뽑기
  y_mean <- c(y_mean,mean(x))
  y_median <- c(y_median,median(x))
  
  # trim_mean
  arr <- sort(x)
  temp <- arr[trim: (n - trim -1)]
  y_trim_mean <- c(y_trim_mean,mean(temp))
}

# mse 값 구하기.
mse_mean <-sum((y - mean(y_mean))**2)/length(y)
mse_median <- sum((y - mean(y_median))**2)/length(y)
mse_trim_mean <- sum((y - mean(y_trim_mean))**2)/length(y)

mse_mean
mse_median
mse_trim_mean


# antithetic 이용하기. (숙제에서 나왔었는데, 교재에서 참고했던 부분임)
# normal 분포의 cdf 구하기.

MC.phi <- function(x, R = 10000, flag = TRUE){
  u <- runif(R/2)
  ifelse(flag, v <- 1-u, v <- runif(R/2))
  u <- c(u,v)
  #cdf <- numeric(x)
  #for (i in 1:length(x)){
  # g <- x[i]*exp(-(u*x[i])^2/2)
  #cdf[i] <- mean(g) / sqrt(2*pi) + 0.5
  #}
  g <- x*exp(-(u*x)^2/2) # 이건식변환으로 구한거임.
  cdf <- mean(g)/sqrt(2*pi) + 0.5 # 0.5를 더한 이유는 normal에서 - ㅇㅕㅇ
  #print(var(u))
  return (cdf)
}

m <- 1000
MC1 <- MC2 <- numeric(m)
x <- 1.95
for (i in 1:m){
  MC1[i] <- MC.phi(x, flag = FALSE)
  MC2[i] <- MC.phi(x)
}
sd(MC1)
sd(MC2)

(var(MC1) - var(MC2)) / var(MC1) #해당하는 비율만큼의 variance reduction

