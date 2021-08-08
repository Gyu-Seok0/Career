## 6주차 화요일 수업 ##

# 기본 setting
n <- 10000
set.seed(0)
arr <- runif(n)

# trimmed mean 이용하기
k <- 0.2 #
trim <- n*k
arr <- sort(arr)
temp <- arr[trim: (n-trim-1)]

# 중앙값
median(temp)
median_var <- mean((temp - median(temp))**2)
median_var

# 평균
mean(temp)
mean_var <- mean((temp - mean(temp))**2)
mean_var # median_var 보다 살짝 작다.

# power(검정력) 구하기 P(H1 : H1)
z_alpha <- 1.645
temp <- c(-3:3)
power <- 1 - pnorm(z_alpha - temp/sqrt(n)) # mean = 0, sd = 1을 고정 
plot(temp, power)


## 6주차 금요일 수업 ##

# 1) contaminated rate 
# 2) 표본평균, 중앙값, trim mean
# 3) MSE값 비교

epoch <- 10000
y_mean <- y_median <- y_trim_mean <- numeric(epoch)
k <- 0.2
trim <- 10*k

for (i in 1:epoch){
  x1 <- rnorm(9)
  x2 <- rnorm(1, mean = 5, sd = 6)
  x <- c(x1,x2)
  
  y_mean[i] <- mean(x)
  y_median[i] <- median(x)
  
  x <- sort(x)
  temp <- x[trim : (10 - trim - 1)]
  y_trim_mean[i] <- mean(temp) 
}

# MSE 비교하기 
# var로 비교하는 이유는, unbiased estimator로 가정하기 때문이다. 
var(y_mean)  # 3
var(y_median) # 2 
var(y_trim_mean) # 1 (작은 순서)

## 추가 정리(MC) ##

# ex1) 원주율 구하기
# 방법1. Hit/Miss
Phi <- function(num){
  x <- runif(num)
  y <- runif(num)
  cnt <- sum(x^2 + y^2 <= 1)
  return (4*cnt/num)
}
Phi(10000)

# 방법2. Sample mean
Phi2 <- function(num){
  x <- runif(num)
  return(mean(sqrt(1 - x^2)) * 4)
}
Phi2(10000)

# 두 방법을 m번의 시뮬레이션을 통해서 비교해보자.
m <- 1000
Hit_MC <- SM_MC <- numeric(1000)
for (i in 1:m){
  Hit_MC[i] <- Phi(10000)
  SM_MC[i] <- Phi2(10000)
}
1 - var(SM_MC)/var(Hit_MC)  # varinace reduction이 70% 가능함을 알 수 있음.

# ex2) normal 분포 적분하기.
ans <- pnorm(1) - pnorm(0)
ans
# Hit / Miss
Hit <- function(num){
  x <- runif(num)
  y <- runif(num)
  return (sum(y <= dnorm(x)) / num)
}
Hit(10000)

# Sample mean
SM <- function(num){
  x <- runif(num)
  return (mean(dnorm(x)))
}
SM(10000)

# 신뢰구간 99%, 오차한도 0.0001, 0~1범위에서 필요한 sample의 개수는?
# 높이에 해당하는 C값은 우리가 정할 수 있음.
sample_num <- function(alpha, error, a,b,c){
  return (c^2 * ((b-a)^2) / (4*alpha*error^2))
}
sample_num(0.01, 0.0001, 0, 1, 1)

# 역변환법으로 exp(1/lambda)인 난수생성 
random_exp <- function(n, lambda){
  return (-log(runif(n))/lambda)
}
arr <- random_exp(10000,1/3)
mean(arr)