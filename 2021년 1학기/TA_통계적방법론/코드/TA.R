# 
matrix(runif(10*10), nrow = 10, ncol = 10)

# lottery
sample(1:45, 6, replace = FALSE)

# NUMBER
sample(letters, 5)

# multi-nomial
table(sample(1:3, size = 100, replace = TRUE, prob = c(.2,.3,.5)))

# ppois --> 적어도 사건이 3번이상은 일어났을 확퓰 
1- ppois(2,3) # x =2 까지의 probability인데, 람다는 3을 의미한다. 


####
# random number genearte
par(mfrow = c(1, 2))
no <- 1000

m <- rep(NA, no)
for(i in 1:no){
  m[i] <- mean(rexp(30, 10))
}
hist(m, prob= T, col = 'wheat')
hist(scale(m), prob= T, col = 'skyblue')
curve(dnorm(x,0,1), -3, 3, col = 'red', add = TRUE)

# 표본평균들이 점차 모평균을 향해서 간다는 걸 알 수 있는
n<- 10000
x = runif(n)
x = cumsum(x)/ (1:n) # 누적합 / 누적개수
plot(x)
mean(x) # 모평균
length(1.95)



