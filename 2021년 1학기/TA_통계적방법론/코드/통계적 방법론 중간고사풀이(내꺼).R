# 통계적 방법론 중간고사
# A1
install.packages("lattice")
library(lattice)

# lattice plot pakage 내부를 잘사용했는지, 
# panel을 사용했는지
bwplot(yield ~ variety|site, data=barley, panel=panel.bwplot) 

#간단히 논하기 --> 제대로 된 해석을 하기만하면 점수 주기

bwplot(yield ~ variety|year, data=barley, panel=panel.bwplot) 


#A2 --> 일단 패스
--> 교수님 한테 문의 드리기.
'''
1) X ~ Binomial(n,p) 인 표본을 뽑는다. (질문내용)
2) 표본의 평균과 분산을 구한다.
3) 해당 값이 np와 npq를 따르는지 확인한다. 
'''

# 방법1 
n <- 50  #표본개수 
p <- 0.1  #확률 
x_mean <- c()
x_var <- c()

m <- 100 #시뮬레이션 
for (i in 1:m){
  arr <- rbinom(n,n,p) #표본추출 (N번의 성공횟수)
  x_mean <- c(x_mean, mean(arr)) #평균 저장 
  x_var <- c(x_var, var(arr)) #분산 저장 
}

mean(x_mean)
mean(x_var)
plot(1:m,cumsum(x_mean)/(1:m), xlab = "Simulation", ylab = "expected")
abline(h = n*p, col = "red")

# A3
# 이렇게 N이 커짐에 따라 모평균에 수렴한다는 
# 대수의 법칙을 증명하는게 핵심임. 
m <- 1000
X <- c()
for (i in 1: m){
  test <- rexp(n = i, rate = 2)
  X <- c(X, mean(test))
  }
plot(1:m, cumsum(X)/(1:m), xlab = "the number of sample")

# A4
# 사람의 수가 23명
# 사람마다 생일을 부여하자
# 그리고 같은 사람이 적어도 하나 있는지 확인하기 
# 이렇게 시뮬레이션을 계속 돌리면 된다.

m <- 10000  # 시뮬레이션 횟수 
temp <- c()
for (i in 1:m){
  x <- sample(365, size = 23, replace = TRUE)
  if (sum(duplicated(x)) > 0){
    temp <- c(temp, 1) # 누적합
  }
  else{
    temp <- c(temp, 0)
  }
}
plot(1:m , cumsum(temp) / (1:m))


# 문제풀이 
n_vec <- c(10, 20, 30, 50)
p_vec <- c(0.1, 0.2, 0.3)

par(mfrow=c(2, 2)) 
for (n in n_vec){
  for (p in p_vec){
    mu <- n * p
    sigma <- sqrt(n * p * (1-p))
    
    plot(dbinom(0:n, n, p), main = paste('mu = ', mu, ', sigma = ', sigma))
    lines(dnorm(0:n, mu, sigma))
  }
}

y <- dbinom(0:20, size=20, prob=0.5)
dbinom(12,size = 20, prob = 0.5) # 20번 중, 12번의 성공 확률 

