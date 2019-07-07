rm(list=ls())
data <- readLines("NCTOP120.txt")
data <- as.data.frame(data)
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
data <- data[!apply(is.na(data),1,all),]
names(data)
names <- c('School Name','Location','State Ranking','National Ranking','Information','NA1','Graduation Rate','NA2','College Readiness','NA3','Enrollment 9-12','NA4')
names(data) <- names
data2 <- data %>%
  select(`School Name`,Location,`State Ranking`,`National Ranking`,Information,`Graduation Rate`,`College Readiness`,`Enrollment 9-12`) %>%
  filter(str_detect(Location, "Raleigh|Durham|Chapel Hill|Cary"))
  na.omit
View(data2)

RTP15_1 <- RTP15 %>%
  mutate(City = (strsplit(Location, split = '|', fixed = TRUE)))
View(RTP15_1)
RTP15$Location <- as.character(RTP15$Location)
class(RTP15$Location)
strsplit(string,split='|', fixed=TRUE)

RTP15_2 <- RTP15_1 %>%
  separate(City, c("NA", "City_Name"))
View(RTP15_2)

RTP <- head(data2,15)
RTP$`School Name` <- factor(RTP$`School Name`, levels=RTP$`School Name`)

ggplot(RTP, aes(RTP$`School Name`,RTP$`College Readiness`,fill=RTP$Location)) +
  geom_col()+
  scale_x_discrete(limits = rev(levels(RTP$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("RTP Top 15 High school's College Readiness \n (Raleigh, Durham, Chapel Hill, Cary)") + 
  theme(plot.title = element_text(face = "bold.italic", colour = "Red", size = 17)) 


ggplot(RTP15_2, aes(RTP15_2$`School Name`,RTP15_2$`College Readiness`,fill=RTP15_2$City_Name), label=RTP15_2$`National Ranking`) +
  geom_col()+
  scale_x_discrete(limits = rev(levels(RTP$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("RTP Top 15 High school's College Readiness \n (Raleigh, Durham, Chapel Hill, Cary)") + 
  theme(plot.title = element_text(face = "bold.italic", colour = "Red", size = 17)) +
  scale_fill_discrete(name = "City") + ylab("College Readiness")
  
dev.off()  
View(RTP15_2)
library(dplyr)
RTP15_3 <- RTP15_2 %>%
  mutate("NC Ranking" = gsub("in North Carolina Rankings","NC Ranking",RTP15_2$`State Ranking`))
View(RTP15_3)
  RTP15_2$`State Ranking` <- gsub("in North Carolina Rankings","NC Ranking",RTP15_2$`State Ranking`)
  

ggplot(RTP15_3, aes(RTP15_3$`School Name`,RTP15_3$`College Readiness`,fill=RTP15_3$City_Name, label=RTP15_3$`NC Ranking`)) +
  geom_bar(stat="identity")+
  scale_x_discrete(limits = rev(levels(RTP$`School Name`))) +
  coord_flip() + xlab("") + ggtitle("RTP Top 15 High school's College Readiness \n (Raleigh, Durham, Chapel Hill, Cary)") + 
  theme(plot.title = element_text(face = "bold.italic", colour = "Red", size = 17)) +
  scale_fill_discrete(name = "City") + ylab("College Readiness") +
  geom_text(position = "stack")

View(RTP)

