setwd("C:/Users/Joey/Documents/R/Project")
library(dplyr)
data <- readLines("NC_School_Ranking.txt")
data <- as.data.frame(data)
data1 <-unlist(data)
data

View(data)
data <- data[!apply(is.na(data) | data == "", 1, all),]


data2[!apply(data2 == "", 1, all),]
View(data2)

class(data)
data <- as.data.frame(data)
nrow(data)
a <- 1
for (i in 1:nrow(data)) {
  for(j in 1:12) {
    data[i,j] <- data[a,1]
    a <- a + 1
  }
}

View(data1)
data1 <- data[!apply(is.na(data),1,all),]
names(data)
names <- c('School Name','Location','State Ranking','National Ranking','Information','NA1','Graduation Rate','NA2','College Readiness','NA3','Enrollment 9-12','NA4')
names(data) <- names
data <- data %>%
  select(`School Name`,Location,`State Ranking`,`National Ranking`,Information,`Graduation Rate`,`College Readiness`,`Enrollment 9-12`) %>%
  na.omit
View(data)

install.packages("ggplot2")
NC_TOP10 <- head(data,10)
ggplot(NC_TOP10, aes())
write.csv(data,"NC_Ranking.csv")

data1 <- data 
View(data1)
data1$`School Name` <- factor(data$`School Name`, levels=data$`School Name`)
head(data)
library(ggplot2)
ggplot(data1,aes()) + 
  geom_col() + 
  scale_x_discrete(limits = rev(levels(data1$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("NC TOP 20 High school's College Readiness") + 
  theme(plot.title = element_text(face = "bold.italic", colour = "blue", size = 17))

class(data3$`School Name`)
data3 <- data %>%
  select(`School Name`,`College Readiness`)
head(data3)
ggplot(data3,aes("School Name", "College Readiness",fill="School Name")) +
  geom_col() + 
  scale_x_discrete(limits = rev(levels(data3$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("NC TOP 20 High school's College Readiness") + 
  theme(plot.title = element_text(face = "bold.italic", colour = "blue", size = 17))  

names(data3) <- c("Name","Readiness")
View(data3)
ggplot(data3, aes(Name,Readiness, fill=Name) + 
         geom_col() + 
         coord_flip()
dev.off()       
data3$Name <- factor(data3$Name, levels=data3$Name)
class(data3$Name)
ggplot(data3, aes(Name,Readiness,fill=Name)) + 
  geom_col() + 
  scale_x_discrete(limits = rev(levels(data3$Name))) +
  coord_flip() + xlab("") + ggtitle("NC TOP 20 High school's College Readiness") + 
  theme(plot.title = element_text(face = "bold.italic", colour = "blue", size = 17))  

data$`School Name`  <- factor(data$`School Name`, levels=data$`School Name`)
View(data)
ggplot(data,aes(data$`School Name`,data$`College Readiness`,fill="School Name")) + 
  geom_col(show.legend = F) + 
  scale_x_discrete(limits = rev(levels(data$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("NC Top 20 High school's College Readiness") + 
  theme(plot.title = element_text(face = "bold", colour = "black", size = 17)) +
  ylab("(College Readiness)") 

Top10$`School Name` <- factor(Top10$`School Name`,levels = Top10$`School Name`)
Top10<-head(data,10)
ggplot(Top10,aes(Top10$`School Name`,Top10$`College Readiness`,fill=Top10$`School Name`)) + 
  geom_col(show.legend = F) + 
  scale_x_discrete(limits = rev(levels(Top10$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("NC Top 10 High school's College Readiness") + 
  theme(plot.title = element_text(face = "bold", colour = "black", size = 17)) +
  ylab("(College Readiness)") 


windowsFonts()
myFont1 <- "Times New Roman"

library(extrafont)
install.packages("extrafont")
font_import()
loadfonts(device = 'win')
fonts()

names(data) <- c("고등학교","도시","주 랭킹", "전국 랭킹", "정보", "졸업률", "대학 준비도", "학생수 9-12")
write.csv(data,"NC Ranking1.csv",fileEncoding = "UTF-8")
View(data)

install.packages("readr")
library(readr)
write_excel_csv(data,"NC Ranking2.csv")
