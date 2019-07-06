setwd("C:/Users/Joey/Documents/R/Project")
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

View(data)
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

library(ggplot2)
ggplot(data1,aes(`School Name`,`College Readiness`,fill= 'School Name')) + 
  geom_col() + 
  scale_x_discrete(limits = rev(levels(data1$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("NC TOP 20 High school's College Readiness") + 
  theme(plot.title = element_text(face = "bold.italic", colour = "blue", size = 17))
  


