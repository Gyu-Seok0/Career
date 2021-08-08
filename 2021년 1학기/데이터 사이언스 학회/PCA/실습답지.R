# step1: scale
t_iris <- transform(iris,
                    Sepal.Length = scale(iris$Sepal.Length),
                    Sepal.Width = scale(iris$Sepal.Width),
                    Petal.Length = scale(iris$Petal.Length),
                    Petal.Width = scale(iris$Petal.Width)
                    )


#step2: 상관계수 확인하기 & 산점도 그리기.
cor(t_iris[-5])
plot(t_iris[-5])

#step3: 주성분 분석 및 해석하기
result <- prcomp(t_iris[-5])
print(result)
summary(result)

#step4: Screen plot으로 몇개의 PC를 고르면 좋을지 생각해보기
plot(prcomp(t_iris[,c(-5)]), type="l",sub = "Scree Plot")

#step5: biplot으로 시각화하기
biplot(prcomp(t_iris[,c(-5)]), cex = c(0.7, 0.8))



