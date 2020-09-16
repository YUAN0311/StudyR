.libPaths("D:/RStudio")
setwd("D:/RStudio/StudyR/dplyr/價差練習")
#install.packages("dplyr")
#install.packages("tidyverse")
library(dplyr)
library(tidyverse)
rm(list=ls())
#讀取資料
first_day=read.csv("20200102.csv",
                   header = TRUE,
                   sep=",",
                   fileEncoding = 'utf8',
                   stringsAsFactors = FALSE) %>% as_tibble()
last_day=read.csv("20200619.csv",
                  header = TRUE,
                  sep=",",
                  fileEncoding = 'utf8',
                  stringsAsFactors = FALSE) %>% as_tibble()

#取要的欄位
first1=first_day[,c(1,2,9)]
last1=last_day[,c(1,2,9)]
first1$收盤價 = as.numeric(gsub("," ,"", first1$收盤價))
first1
first2=first1[-3,]
last1$收盤價 = as.numeric(gsub("," ,"", last1$收盤價))
last1
last2=last1[-4,]

#合併
a=left_join(first1,last1,by = c("證券代號" = "證券代號"))
a
b=left_join(first2,last2,by = c("證券代號" = "證券代號"))
b
c=full_join(first2,last2,by = c("證券代號" = "證券代號"))
c
#驗證是否有重複值
duplicated(a["證券代號"])
duplicated(c["證券代號"])

#取要的欄位
x=a[,c(1,2,3,5)]

#變更欄位名稱
fields=c('證券代號','證券名稱','first','last')
names(x)=fields
x

#新增欄位算差價
x=x %>% mutate(maxDif = first-last)
x
#排序差價小到大
x %>% arrange(maxDif)

write.csv(c,"price.csv",row.names = F,fileEncoding = 'utf8')
