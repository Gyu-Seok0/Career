# 몬테 카를로 알고리즘
# Random number Generate을 통해서, 적분이 가능하다.

#1) Uniform(0, 0.5) 해당하는 점구하기 --> 한번 plot 그려볼까
#2) e^-x 보다 작다면 count,
#3) 확률을 나타냄.


#1-1 unfiorm 
n <- 20000  # sample 개수 
x <- runif(n, min = 0, max = 0.5) # sample의 x 값
y <- runif(n, min = 0, max = 1) # sample의 y 값

acc <- (sum(y < exp(-x)) / n) * 0.5 # y값과 추정값을 비교
acc #예측값
1 - exp(-0.5) #실제값
var(y)

#1-2 exp
x2<- rexp(n, rate= 1)
x2<- x2[x2 < 0.5]
y2<- rexp(length(x2), rate = 2)

acc2 <- (sum(y2 < exp(-x2)) / length((x2))) * 0.5
acc2
var(y2)
