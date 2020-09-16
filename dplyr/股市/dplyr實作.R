.libPaths("D:/RStudio")
setwd("D:/RStudio/StudyR/dplyr/股市")
#install.packages("dplyr")
#install.packages("tidyverse")
library(dplyr)
library(tidyverse)
rm(list=ls())
options(pillar.subtle = FALSE)
options(pillar.sigfig = 7)
#讀取資料
stockData=read.csv("stockdata.csv",
                   header = TRUE,
                   sep=",",
                   stringsAsFactors = FALSE) %>% as_tibble()
epsData=read.csv("eps.csv",
                 header = TRUE,
                 sep = ",",
                 stringsAsFactors = FALSE) %>% as_tibble()
#查看資料類型
class(stockData)
#觀看資料所有欄位(變數)名稱
colnames(stockData)
#觀看資料筆數、變數數量
dim(stockData)
#觀看資料前10筆
head(stockData,10)

#Arrange
#將資料依照股票代碼code從小排到大，且依日期date從大排到小
stockData_arrange=stockData %>% arrange(code,-date)
head(stockData_arrange,10)

#Select
#從資料中依序選出代碼code、產業別ind、以及收盤價close欄位
stockData %>% select(code,ind,close)
#依照特定名單選取所需欄位
co1List=colnames(stockData)[c(1:4)]
co1List
stockData %>% select(co1List)
#將資料中的產業ind欄位刪除
stockData %>% select(-ind)

#Filter
#從資料中篩選出收盤價close高於500元者
stockData %>% filter(close>=500)
#從資料中篩選出股票代碼code為1101且收盤價close大於30元者
a=stockData %>% filter(code==1101,close>30)
b=stockData %>% filter((code==1101) & (close>30))
#查看a與b是否相同
identical(a,b)
#從資料中篩選出股票代碼code在特定名單codeList內者
codeList=c(1101,1102,1103)
#%in%
stockData %>% filter(code %in% codeList)

#Mutate
#將現有資料欄位經過計算後形成新欄位
#將資料中的最高價high減去最低價low，形成最大價差maxDif欄位，應將其取log
stockData %>% mutate(maxDif=high-low,
                     log_maxDif= log(maxDif))
#將資料排序序號形成新欄位n
rownumber_stockData=stockData %>% mutate(n=row_number())
write.csv(rownumber_stockData,"output.csv",row.names = FALSE)
stockData %>% mutate(n=row_number()+10)
#將收盤價close取log後形成新欄位lClose
stockData %>% mutate( lClose = log(close))

#Group_By
#將資料依照特定欄位內容分組
#將資料依照產業ind分群，並查詢每群組中最低價的收盤價close
#分組前
stockData %>% filter(close==min(close))
#分組後
stockData %>% group_by(ind) %>% filter(close== min(close))

#Summarise
#將資料做總結，常搭配group_by()使用
#查看每個產業(ind)的收盤價(close)平均數(mean)
stockData%>% group_by(ind)%>% summarise(sum_close=mean(close))
stockData%>% group_by(ind)%>% mutate(sum_close=mean(close))                
#lag
#將數列往"下"移動一格,計算報酬率時常用
y=stockData %>% arrange(code,date) %>% group_by(code) %>% mutate(ret = (close/lag(close,1)) -1)                     
y
#distinct
#將指定變數中的"非重複"值抽出
stockData %>% distinct(ind)

#left_join
#以左表為主表，將右表為副表對應合併，左表沒有者忽略
left_join(stockData,epsData,by = c("code" = "code"))

x=tibble(code=1:5,price=51:55)
x %>% filter((code==5)|(code==2))
x %>% filter(code==5,code==2)
x %>% filter(code %in% c(2,5))

             