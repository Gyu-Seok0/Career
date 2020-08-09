#환경설정1 library 불러오기
library(multilinguer)
library(rJava)
library(memoise)
library(KoNLP)
library(dplyr)
library(ggplot2)
library(stringr)
library(wordcloud)
library(RColorBrewer)

#환경설정2 data 불러오기 및 전처리
data <- readLines("test.csv", encoding = "UTF-8")
title <- unlist(strsplit(data,split = ",")[1])
a2 <- strsplit(data,split=",")[2]
df <- as.data.frame(matrix(data = unlist(a2),nrow=1))

for (i in 3:length(data)){
  temp <- strsplit(data,split=",")[i]
  temp_df <- as.data.frame(matrix(data = unlist(temp),nrow=1))
  df <- rbind(df,temp_df)
} #받은 data를 하나의 data.frame으로 만들기
colnames(df)<- title #column 이름설정

#####################################################

#step1 원하는 데이터 뽑아내기
test_df <-df[df$과목명== "소프트웨어 입문",]
test_df <-df[df$과목명== "소프트웨어 입문" & df$수강당시성적=="A+",]
test_df <-df[df$과목명== "소프트웨어 입문" & df$수강당시성적=="B+",] 

#step2 데이터 분석을 위한 코드 실행
txt<- test_df$주관평가
txt <- str_replace_all(txt, "\\W"," ")
nouns <- extractNoun(txt)
wordcount <- table(unlist(nouns))
df_word <-as.data.frame(wordcount, stringsAsFactors = F)
df_word <- df_word %>%rename(word=Var1, freq = Freq)
df_word <- df_word %>%filter(nchar(word)>=2)
top20 <- df_word %>% arrange(desc(freq))%>%head(20)
order <- arrange(top20, freq)$word

#step3 데이터 시각화
#1 막대그래프
ggplot(data=top20, aes(x=word, y=freq))+geom_col()+coord_flip()+scale_x_discrete(limit=order)+geom_text(aes(label=freq),hjust=-0.3)

#2 워드클라우드
pal <- brewer.pal(8,"Dark2")
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = 0.1,
          scale = c(4,0.3),colors = pal)

############################################
#step4 감성분석
library(twitteR)
library(plyr)
#군산대학교 소프트웨어학과 감성사전(한글)을 활용.
positive <- readLines("positive.txt", encoding = "UTF-8")
positive = positive[-1]
negative <- readLines("negative.txt", encoding = "UTF-8")
negative = negative[-1]

#감성분석을 위한 함수구현
sentimental = function(sentences, positive, negative){
  
  scores = laply(sentences, function(sentence, positive, negative) {
    
    sentence = gsub('[[:punct:]]', '', sentence) # 문장부호 제거
    sentence = gsub('[[:cntrl:]]', '', sentence) # 특수문자 제거
    sentence = gsub('\\d+', '', sentence)        # 숫자 제거
    
    word.list = str_split(sentence, '\\s+')      # 공백 기준으로 단어 생성 -> \\s+ : 공백 정규식, +(1개 이상)
    words = unlist(word.list)                    # unlist() : list를 vector 객체로 구조변경
    
    pos.matches = match(words, positive)           # words의 단어를 positive에서 matching
    neg.matches = match(words, negative)
    
    pos.matches = !is.na(pos.matches)            # NA 제거, 위치(숫자)만 추출
    neg.matches = !is.na(neg.matches)
    
    score = sum(pos.matches) - sum(neg.matches)  # 긍정 - 부정   
    return(score)
  }, positive, negative)
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}
#감성분석 데이터 시각화를 위한 환경설정
result = sentimental(txt,positive,negative)
result$color[result$score >=1] = "blue"
result$color[result$score ==0] = "green"
result$color[result$score < 0] = "red"

result$remark[result$score >=1] = "긍정"
result$remark[result$score ==0] = "중립"
result$remark[result$score < 0] = "부정"

sentiment_result <- table(result$remark)
pie(sentiment_result, main = "감성분석 결과", col = c("blue", "red","green"), radius = 0.8)

#긍정/부정/중립 count 및 내용
mean(result$score)
table(result$remark) 
t <- result[result$remark== "긍정",]    #부정, 중립으로 바꾸면 해당 내용을 확인 하실 수 있습니다. 




