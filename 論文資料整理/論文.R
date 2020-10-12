.libPaths("D:/RStudio")
setwd("D:/RStudio/StudyR/論文資料整理")
install.packages("rJava")
install.packages("jiebaR")
install.packages("tmcn")
# 安裝R-Forge 套件語法
install.packages("Rwordseg", repos = "http://R-Forge.R-project.org")
library(dplyr)
library(lubridate)
library(stringr)
library(jiebaR)

#輸入問卷斷詞檔案
new_word <- read.csv("new_word整理.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")

#問卷詞頻計算
cut_new_word=freq(new_word[,1])
#由大到小
bts_cut_new_word <- arrange(cut_new_word, desc(freq))
bts_cut_new_word
write.table(bts_cut_new_word,file="bts_cut_new_word.csv",append = F,row.name=F,fileEncoding = "UTF-8")

