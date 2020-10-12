.libPaths("D:/RStudio")
setwd("D:/RStudio/StudyR/斷詞")
install.packages("rJava")
install.packages("jiebaR")
install.packages("tmcn")
# 安裝R-Forge 套件語法
install.packages("Rwordseg", repos = "http://R-Forge.R-project.org")
library(dplyr)
library(lubridate)
library(stringr)
library(jiebaR)
install.packages("wordcloud")
library(wordcloud)
install.packages("tm")          # text mining，文字探勘套件，可將文字檔轉檔給R處理
install.packages("wordcloud")   # 本次主角，產出文字雲
library(tm)
library(wordcloud)

rm(list=ls())


x <- read.csv("中華航空評價.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
cutter <- worker(bylines = F)

# 匯出新詞
new_words <- c("中華航空")
writeLines(new_words, "new_words.txt")
# 設定停止詞
stop_words <- c("在","的","下","個","來","至","座","亦","與","或","日","月","年","週")
writeLines(stop_words, "stop_words.txt")
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)

a=cutter[x[1,4]]
write.table(a,file="x.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  a=cutter[x[i,4]]
  write.table(a,file="x.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}
e <- read.csv("x.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")

w=freq(e[,1])

txt_freq <- arrange(w, desc(freq))
txt_freq

a=cutter[x[1,4]]
b=paste0(length(a),",")
c=paste0(a,collapse="",",")
d=paste0(b,c,collapse="",",")
write.table(d,file="word.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  a=cutter[x[i,4]]
  b=paste0(length(a),",")
  c=paste0(a,collapse="",",")
  d=paste0(b,c,collapse="",",")
  write.table(d,file="word.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

a=cutter[x[1,4]]
c=paste0(a,collapse="",",")
d=paste0(c,collapse="",",")
write.table(d,file="word1.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  a=cutter[x[i,4]]
  c=paste0(a,collapse="",",")
  d=paste0(c,collapse="",",")
  write.table(d,file="word1.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

a=cutter[x[1,4]]
a
z=for (i in 1:543 ) {
  a=cutter[x[i,4]]
}
z


e <- read.csv("xxx.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
e[1,]

e[2,2]
e[3,1]
# 計算詞彙頻率
d <- freq(e[1,1:3])
d


