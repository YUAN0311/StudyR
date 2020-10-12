.libPaths("D:/RStudio")
setwd("D:/RStudio/StudyR/研討會論文")
install.packages("rJava")
install.packages("jiebaR")
install.packages("tmcn")
# 安裝R-Forge 套件語法
install.packages("Rwordseg", repos = "http://R-Forge.R-project.org")
library(dplyr)
library(lubridate)
library(stringr)
library(jiebaR)

#有形性
#匯入總表
tangible <- read.csv("有形性.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)

#總表斷詞、輸出檔案
b=cutter[tangible[1,1]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="tangible.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[tangible[i,1]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="tangible.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
tangible_word <- read.csv("tangible.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_tangible_word=freq(tangible_word[,1])
#由大到小
bts_count_tangible_word <- arrange(count_tangible_word, desc(freq))
bts_count_tangible_word
write.table(bts_count_tangible_word,file="bts_count_tangible_word.csv",append = F,row.name=F,fileEncoding = "UTF-8")


#可靠性
#匯入總表
reliability <- read.csv("可靠性.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)

#總表斷詞、輸出檔案
b=cutter[reliability[1,1]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="reliability.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[reliability[i,1]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="reliability.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
reliability_word <- read.csv("reliability.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_reliability_word=freq(reliability_word[,1])
#由大到小
bts_count_reliability_word <- arrange(count_reliability_word, desc(freq))
write.table(bts_count_reliability_word,file="bts_count_reliability_word.csv",append = F,row.name=F,fileEncoding = "UTF-8")


#反應性
#匯入總表
responsiveness <- read.csv("反應性.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)

#總表斷詞、輸出檔案
b=cutter[responsiveness[1,1]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="responsiveness.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[responsiveness[i,1]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="responsiveness.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
responsiveness_word <- read.csv("responsiveness.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_responsiveness_word=freq(responsiveness_word[,1])
#由大到小
bts_count_responsiveness_word <- arrange(count_responsiveness_word, desc(freq))
write.table(bts_count_responsiveness_word,file="bts_count_responsiveness_word.csv",append = F,row.name=F,fileEncoding = "UTF-8")


#保證性
#匯入總表
assurance <- read.csv("保證性.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)

#總表斷詞、輸出檔案
b=cutter[assurance[1,1]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="assurance.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[assurance[i,1]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="assurance.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
assurance_word <- read.csv("assurance.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_assurance_word=freq(assurance_word[,1])
#由大到小
bts_count_assurance_word <- arrange(count_assurance_word, desc(freq))
write.table(bts_count_assurance_word,file="bts_count_assurance_word.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#關懷性
#匯入總表
empathy <- read.csv("關懷性.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)

#總表斷詞、輸出檔案
b=cutter[empathy[1,1]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="empathy.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[empathy[i,1]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="empathy.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
empathy_word <- read.csv("empathy.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_empathy_word=freq(empathy_word[,1])
#由大到小
bts_count_empathy_word <- arrange(count_empathy_word, desc(freq))
write.table(bts_count_empathy_word,file="bts_count_empathy_word.csv",append = F,row.name=F,fileEncoding = "UTF-8")

