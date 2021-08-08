### 통계적 방법론 문제임! ###

n <- 30
arr <- runif(n, min = 0, max = 1)
mean(arr)
var(arr)



# 큰 수의 법칙
test_norm <- rnorm(10000, mean =0, sd = 9)
test_norm <- cumsum(test_norm)/ 1: 10000
plot(test_norm)
test_norm

#교수님이 짜주신 코드
# N(0,4)일때
n <- 5  # 표본의 개수
m <- 1000 # 시뮬레이선 개수
c <- 0
sdn <- sqrt(4/n)
se <- 1.96*2/sqrt(n)

# 쓰인 변수는 sdn
for (i in 1: m){
  x <- rnorm(1,0, sd = sdn) # 분포가 하나만 가져오면 된다. --> xbar의 분포니까. 
  # 신뢰구간 영역을 벗어난 점들
  if (abs(x) > se){
    c = c +1
  }
  # 신뢰구간 영역을 들어온 점들 
  tc <- m - c
  cl <- tc/m #confidence level
}


# 할필요가 없구나.. 
cl_value <-abs(qnorm(0.5 - cl/2))

0 - cl_value*sdn < x  < 0 + cl_value*sdn
cl_value*sdn



# 이렇게 신뢰구간을 구했는데 도대체 task가 뭔지 잘 모르겠다. 
