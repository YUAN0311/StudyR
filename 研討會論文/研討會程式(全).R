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


rm(list=ls())
#未清理
#匯入總表
allword <- read.csv("中華航空評價總表.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(bylines = F)

#總表斷詞、輸出檔案
a=cutter[allword[1,4]]
write.table(a,file="allword.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  a=cutter[allword[i,4]]
  write.table(a,file="allword.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}
#輸入檔案
cutall <- read.csv("allword.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
#詞頻計算
countall=freq(cutall[,1])
#由大到小
library(dplyr)
bigtosmall <- arrange(countall, desc(freq))
bigtosmall
write.table(bigtosmall,file="allwordbigtosmall.csv",append = F,row.name=F,fileEncoding = "UTF-8")



#已清理
#匯入總表
newallword <- read.csv("中華航空評價總表.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(bylines = F)

cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[newallword[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="newallword.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[newallword[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="newallword.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
cutnewall <- read.csv("newallword.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
countnewall=freq(cutnewall[,1])
#由大到小
library(dplyr)
newbigtosmall <- arrange(countnewall, desc(freq))
newbigtosmall
write.table(newbigtosmall,file="newallwordbigtosmall.csv",append = F,row.name=F,fileEncoding = "UTF-8")


#2018
#匯入總表
word_2018 <- read.csv("2018.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_2018[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_2018.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_2018[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_2018.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_2018 <- read.csv("word_2018.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_2018=freq(allword_2018[,1])

#由大到小

bigtosmall_2018 <- arrange(freq(allword_2018[,1]), desc(freq))
write.table(bigtosmall_2018,file="bigtosmall_2018.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#2019
#匯入總表
word_2019 <- read.csv("2019.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_2019[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_2019.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_2019[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_2019.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_2019 <- read.csv("word_2019.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_2019=freq(allword_2019[,1])
#由大到小
library(dplyr)
bigtosmall_2019 <- arrange(count_2019, desc(freq))
write.table(bigtosmall_2019,file="bigtosmall_2019.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#2020
#匯入總表
word_2020 <- read.csv("2020.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_2020[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_2020.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_2020[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_2020.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_2020 <- read.csv("word_2020.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_2020=freq(allword_2020[,1])
#由大到小
library(dplyr)
bigtosmall_2020 <- arrange(count_2020, desc(freq))
write.table(bigtosmall_2020,file="bigtosmall_2020.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#一等星
#匯入總表
word_one <- read.csv("一等星.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_one[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_one.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_one[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_one.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_one <- read.csv("word_one.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_one=freq(allword_one[,1])
#由大到小
library(dplyr)
bigtosmall_one <- arrange(count_one, desc(freq))
write.table(bigtosmall_one,file="bigtosmall_one.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#二等星
#匯入總表
word_two <- read.csv("二等星.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_two[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_two.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_two[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_two.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_two <- read.csv("word_two.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_two=freq(allword_two[,1])
#由大到小
library(dplyr)
bigtosmall_two <- arrange(count_two, desc(freq))
write.table(bigtosmall_two,file="bigtosmall_two.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#三等星
#匯入總表
word_three <- read.csv("三等星.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_three[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_three.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_three[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_three.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_three <- read.csv("word_three.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_three=freq(allword_three[,1])
#由大到小
library(dplyr)
bigtosmall_three <- arrange(count_three, desc(freq))
write.table(bigtosmall_three,file="bigtosmall_three.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#四等星
#匯入總表
word_four <- read.csv("四等星.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_word.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_four[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_four.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_four[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_four.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_four <- read.csv("word_four.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_four=freq(allword_four[,1])
#由大到小
library(dplyr)
bigtosmall_four <- arrange(count_four, desc(freq))
write.table(bigtosmall_four,file="bigtosmall_four.csv",append = F,row.name=F,fileEncoding = "UTF-8")

#五等星
#匯入總表
word_five <- read.csv("五等星.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
library(jiebaR)
cutter <- worker(user = "new_word.txt", stop_word = "stop_words.txt", bylines = FALSE)



#總表斷詞、輸出檔案
b=cutter[word_five[1,4]]
c=str_remove_all(b, "[0-9a-zA-Z]+?")
write.table(c,file="word_five.csv",append = F,row.name=F,fileEncoding = "UTF-8")

for (i in 2:543 ) {
  b=cutter[word_five[i,4]]
  c=str_remove_all(b, "[0-9a-zA-Z]+?")
  write.table(c,file="word_five.csv",append = T,row.name=F,col.names =F ,fileEncoding = "UTF-8")
}

#輸入檔案
allword_five <- read.csv("word_five.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")


#詞頻計算
count_five=freq(allword_five[,1])
#由大到小
library(dplyr)
bigtosmall_five <- arrange(count_five, desc(freq))
write.table(bigtosmall_five,file="bigtosmall_five.csv",append = F,row.name=F,fileEncoding = "UTF-8")


#2018-2020
#詞頻
#輸入檔案
three_year <- read.csv("2018-2020.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
#詞頻計算
count_three_year=freq(three_year[,1])
bigtosmall_three_year <- arrange(count_three_year, desc(freq))
write.table(bigtosmall_three_year,file="bigtosmall_three_year.csv",append = F,row.name=F,fileEncoding = "UTF-8")


#星等
#詞頻
#輸入檔案
star_level <- read.csv("星等.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
#詞頻計算
count_star_level=freq(star_level[,1])
bigtosmall_star_level <- arrange(count_star_level, desc(freq))
write.table(bigtosmall_star_level,file="bigtosmall_star_level.csv",append = F,row.name=F,fileEncoding = "UTF-8")


#一五比較(方法?)
one_five <- read.csv("一五比較.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
q=left_join(one_five,one_five,by = c("一星等" = "五星等"))
p=right_join(one_five,one_five,by = c("一星等" = "五星等"))
write.table(q,file="onetofive.csv",append = F,row.name=F,fileEncoding = "UTF-8")
write.table(p,file="fivetoone.csv",append = F,row.name=F,fileEncoding = "UTF-8")
