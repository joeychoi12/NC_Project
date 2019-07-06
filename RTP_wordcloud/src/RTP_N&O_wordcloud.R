#NC RTP Word Cloud 
  
  # Text Crawling from Investing.com News article
  setwd("d:/workspace/R_Crawling/")
  library(rvest)
  library(dplyr)
  library(stringr)
  library(openxlsx)
  library(wordcloud2)
  library(tm)  
  trim <- function(x) gsub("^\\s+|\\s+$", "", x)
  
base_url <- "https://www.newsobserver.com/search/?page="
search <- '&q=\'Research+Triangle+Park\''
url_page1 <- paste0(base_url, 2, search)
url_page1
html_test <- read_html(url_page1)
desc1 
html_nodes(html_test,".title") %>% html_text() %>% trim()

article <- c()
  
for (i in 1:161) {
  if(i %% 30 == 0) print(i)
  url <- paste0(base_url,i,search)
  html <- read_html(url)
  title <- trim(html_nodes(html, ".title") %>% html_text())
  article <- c(article,title)
      
}
article_title <- data.frame(title = article)

#Wordcloud
write(article, "data.txt")
data <- readLines('data.txt') 
data<- data %>%
  str_remove("\\n") %>%                   # remove linebreaks
  removeWords(stopwords("english")) %>%   # Remove common words (a, the, it etc.)
  removeWords(c("amp"))  
data <- gsub("Daybook","",data)
data <- gsub("Club Notes:","",data)
data <- gsub("notes:","",data)
data <- gsub("triangle","",data)
data <- gsub("note","",data)

textCorpus <- 
  Corpus(VectorSource(data)) %>%
  TermDocumentMatrix() %>%
  as.matrix()

textCorpus <- sort(rowSums(textCorpus1), decreasing=TRUE)
head(textCorpus)
textCorpus <- data.frame(word = names(textCorpus), freq=textCorpus, row.names = NULL)

library(wordcloud2)  
wordcloud <- wordcloud2(data = textCorpus, minRotation = 0, maxRotation = 0, ellipticity = 0.6)
wordcloud
