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
install.packages("wordcloud2")
library(wordcloud)
library(wordcloud2)
rm(list=ls())
cutter <- worker(bylines = F)
cutter[content]

content="雖說有MAIL 告知班機DELAY 二小時(最後是3小時) , 但是仍需按照原來時間去機場CHECK IN, 大排長龍還不說, 每個櫃台都停擺, 剛開始以為是電腦當機, 後來才知道是轉機旅客的問題, 無法趕上要接的班機, 因為不知公司的安排工作人員只能停下工作等待, 後面無須轉機的旅客也只能等待.....難道不能開闢一個櫃台專門處理轉機的旅客嗎?? 再加上會吵的旅客插隊也能得到想要的回應, 讓守法的旅客只能苦等...這不該是老字號的國營航空公司該有的服務品質再次搭華航前往日本；佩服台灣旅客塞行李的功力！特別是回程；可以見視台灣旅客在日本購買力！回程時辛苦的地勤人員還要檢視旅客隨身行李；苦口婆心的拜託改託運（機艙空間有限）幫忙打包，上了飛機…空服員幫忙塞行李！總之華航服務蠻貼心的！我喜歡搭乘華航…出發前帶著忐忑的心情登上飛機;因為小寶貝剛滿三歲擔心她無法應高空的壓力;飛行的不適而哭鬧，空姐很貼心的拿了小玩具安撫小寶貝;讓寶貝安心無憂的平安的降落目的地，開心的回日本省親~^_^~"
x=cutter[content]
writeLines(x, "content.txt" )

