# data 불러오기
secu_com_finance_2007 <- read.csv("secu_com_finance_2007.csv",
                                  header = TRUE,
                                  stringsAsFactors = FALSE)
secu_com_finance_2007
# step1: scale
secu_com_finance_2007 <- transform(secu_com_finance_2007,
                                   V1_s = scale(V1),
                                   V2_s = scale(V2),
                                   V3_s = scale(V3),
                                   V4_s = scale(V4),
                                   V5_s = scale(V5)
                                   )

#부채비율 방향을 변환
secu_com_finance_2007 <- transform(secu_com_finance_2007,
                                   V4_s2= max(V4_s) - V4_s
                                   )


secu_com_finance_2007
#V4_s2 제거하고, 저장하기
secu_com_finance_2007_2 <- secu_com_finance_2007[,c("company", "V1_s", "V2_s", "V3_s", "V4_s2", "V5_s")]

#step2: 상관계수보기 --> 이를 바탕으로 PCA가 나오기 때문이다. 
secu_com_finance_2007_2
cor(secu_com_finance_2007_2[,-1])

# 산점도 보기.
plot(secu_com_finance_2007_2[,-1])

#step3: 주성분분석.
secu_prcomp <- prcomp(secu_com_finance_2007_2[,c(2:6)])
print(secu_prcomp)
summary(secu_prcomp)

#step4: 성분을 몇개로 고를 것인가?
plot(prcomp(secu_com_finance_2007_2[,c(2:6)]), type="l",sub = "Scree Plot")

#step5: 시각화
biplot(prcomp(secu_com_finance_2007_2[,c(2:6)]), cex = c(0.7, 0.8))

secu_pc1 <- predict(secu_prcomp)[,1]
secu_pc2 <- predict(secu_prcomp)[,2]
text(secu_pc1, secu_pc2, labels = secu_com_finance_2007_2$company, cex = 0.7, pos = 3, col = "blue")

pca <- function(dataset){
  pc = prcomp(dataset, scale = TRUE)
  k = 0
  R = 0
  while(R < 0.8) {
    k = k + 1
    R = sum(pc[[1]][1:k]^2)/sum(pc[[1]]^2)
    cat("When number of Principal Component(k) is ", k,
        ", Cumulative Proportion(R) is ", R, "\n", "\n", sep="")
  }
  SelectedDataSet = pc[[5]][,1:k]
  return(SelectedDataSet)
  }


pca(secu_com_finance_2007_2[,c(2:6)])




