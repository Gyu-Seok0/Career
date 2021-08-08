# 5.3
# e^-x 넓이 구하기
answer <- 1 - exp(-0.5)
answer

#방법1) 적중법
hit_method <- function(n){
  x<- runif(n, min = 0, max = 0.5)
  y <- runif(n, min = 0, max = 1)
  return (sum(y < exp(-x))/n * 0.5)
}
hit_method(10000)

#방법2) 적분법
sample_mean <- function(n){
  arr1 <- runif(n,min = 0, max = 0.5)
  #print("sampe_mean var")
  #print(var(arr1))
  return (mean(exp(-arr1)) * 0.5)
}
sample_mean(10000)


# 추가문제: exponential 분포로 뽑기
# 역변환법을 이용해서, -log(U)/lambda이용하기
exp_inverse <- function(n, lambda){
  arr2 <- -log(runif(n))/lambda
  #print("exp_ var")
  #print(var(arr2))
  return (mean(exp(-arr2[arr2 < 0.5])) * 0.5)
}

exp_inverse(10000,1)


# 5.5번
#Hit/miss 방법과 sample mean의 차이 설명
#기본적으로 sample을 하나만 뽑아도 되는 sample_mean 방법이 더 효과적으로 예측된다.
sample_mean(1000) # sample mean이 정답에 더 가까운 것으로 보인다.
hit_method(1000)
answer


# 5.6번문제풀이 + 5.7번 문제풀이
ans <- exp(1) - 1 # 실제 정답
ans

# antithetic_MC
num <- 10000
u <- runif(num/2)
v <- 1-u
cov(exp(u),exp(v)) # 0보다 작다 --> variance reduction.
var(exp(u) + exp(v))

u <- c(u,v)
mean(exp(u)) # 우리 정답

# Simple 몬테카를로
x <- runif(num,0,1)
mean(exp(x))

# varinace 비교
m <- 1000
antithetic_MC <- Simple_MC <- numeric(m)
for (i in 1:m){
  #simple
  x <- runif(num, min = 0, max = 1)
  Simple_MC[i] <-  mean(exp(x))
  
  #antithetic
  u <- runif(num/2, min =0, max = 1)
  u <- c(u, 1-u)
  antithetic_MC[i] <- mean(exp(u))
}

(var(Simple_MC) - var(antithetic_MC)) / var(Simple_MC) # variance redutcion 96%


# 5.8번
sample <- runif(10000)
constant <- 2
X1 <- constant * sample
X2 <- constant * (1 - sample)
cor(X1,X2) # -1이 나옴을 알 수 있다.