#대덕특구 WordCloud 
setwd("c:/Users/Joey/Documents/R/Project/NC_Project/")
# Text Crawling from Investing.com News article
setwd("d:/workspace/R_Crawling/")
library(rvest)
library(dplyr)
library(stringr)
library(wordcloud2)
trim <- function(x) gsub("^\\s+|\\s+$", "", x)
trim1 <- function(x) gsub("\r", "", x)
trim2 <- function(x) gsub("\t", "", x)
trim3 <- function(x) gsub("\n", "", x)


base_url <- "https://hellodd.com/?md=news&mt=lists&list_type=plists&j_pid=&j_name=&ymd=&sdate=&edate=&cate_code=&find=all&search=대덕특구&page="
url_page1 <- paste0(base_url, 2)
url_page1
html_test <- read_html(url_page1)
html_nodes(html_test,".article") %>% html_text() %>% trim() %>% trim1() %>% trim2()

article <- c()

for (i in 1:347) {
  if(i %% 50 == 0) print(i)
  url <- paste0(base_url,i,encoding="UTF-8")
  html <- read_html(url)
  title <- html_nodes(html, ".article") %>% html_text() %>% trim() %>% trim1() %>% trim2()
  article <- c(article,title)
  
}
article_title <- data.frame(title = article)
write.csv(article_title,"대덕.csv")
View(article_title)
#Wordcloud
install.packages("KoNLP")
library(KoNLP)
useSejongDic()
write(article, "daedeok_data.txt")
data <- readLines('daedeok_data.txt', Encoding="UTF-8") 
data1 <- sapply(data, extractNoun, USE.NAMES = F)

data3 <- unlist(data1)
data3 <- gsub("\\d+","",data3) ## 숫자 없애기 

data3 <- Filter(function(x) {nchar(x) >= 2}, data3) #2글자 이상 필터 
data4 <- str_replace_all(data3, "[^[:alpha:]]","") #한글, 영어이외는 삭제


txt2 <- readLines("경제gsub.txt")
for(i in 1:length(txt2)) {
  data3 <- gsub(txt2[i],"",data3)
}



write(data4,"대덕특구.txt")
data5 <- read.table("대덕특구.txt")
wordcount <- table(data5)
wordcloud <-sort(wordcount,decreasing = T)
head(wordcloud)

wordcloud2(wordcloud)

Sys.getlocale()
Sys.getlocale("LC_ALL","ko_KR.UTF-8")
Sys.setlocale("LC_ALL","ko_KR.UTF-8")
Sys.setlocale("LC_ALL", "korean")
Sys.setlocale("LC_ALL", "en_US.UTF-8") 

