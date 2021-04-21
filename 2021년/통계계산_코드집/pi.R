# 파이 추정하기

#알고리즘
#1) (x,y) 에 해당하는 random number를 만든다.
#2) 해당 값과 x2+y2 = 1 --> root(1 - x^2) 값보다 작으면 확률을 취급한다.
#3) 해당하는 값에 4를 곱하면 원의 넓이가 나온다.
#4) 원의 넓이는 파이*r*r이므로 파이 = 원의 넓이 개념이 성립해서 비교하면 끝

# 실제구현
n <- 1000
x <- runif(n, min = 0, max = 1)
y <- runif(n, min = 0, max = 1)
pi_hat <- 4*(sum(y < sqrt(1 - x**2)) / n)
pi_hat
plot(x,y)



# 책에서 구현
# 내가 이해가 안됐던 부분이 x,y각각에 대한 sampleing 부분이었는데, 어느정도 해소 됌.

pi <- function(n){
  ns <- 0
  for (i in 1: n)
    if (sum(runif(2)^2) < 1){
      ns <- ns +1
    }
  return (4*ns/n)
}

pi(10000)

######### 몬테카를로 적분법을 이용해봅시다. --> x 하나만 가지고도 수행이 가능하다. 
sum(sqrt(1 - x**2)) / n * 4


# 책에 나온방법

Sample_mean <- function(n){
  x <- runif(n)
  return (mean(sqrt(1 - x**2)) * 4)
}
Sample_mean(20000)


# 연습문제 9 (P169)
#x <- seq(-10, 10)
#plot(x,dnorm(x))
answer <- pnorm(1) - pnorm(0) #실제정답
answer

# 방법1 적중법

answer_hat <- function(n){
  x <- runif(n)
  y <- runif(n)
  return (sum(y < dnorm(x))/n)
}
answer_hat(10000)

# 방법2 Sample mean
SM <- function(n){
  x <- runif(n)
  return (mean(dnorm(x)))
}
SM(10000)


find_sample_length <- function(alpha, error, a,b,c){
  return (c**2 * ((b-a) **2) / (4*alpha*(error**2)))
}
# 신뢰구간 99%, 오차한도 0.001에서 (0,1)사이 범위, c = 1 (높이--> 우리가 정할 수 있음) 일때, 샘플의 개수는 2.5*10^7 이더라!
find_sample_length(0.01, 0.001, 0, 1, 1)

# 역변환법에 의한 지수분포의 확률난수발생시키기

rexponenital <- function(n, lambda){ #lambda: 지수분포의 평균은 1/lambda
  return (-log(runif(n))/lambda)
}

rexponenital(100,1)


