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
content <- "限於網站設定必須選擇不同機場，請以出發地點為準。緣於covid19疫情，大部分的國際間移動措施必須受限，但華航發揮巧思，準備一日小小空服員的體驗活動，上午帶孩子認識空服員的工作，下午實際飛行至日本空域再折返。搭乘737機型故經濟艙座位沒有單獨娛樂設施。無論是餐點、設施或服務都非常貼心，感謝企劃人員與全體服務人員的照顧"
# 定義斷詞器
cutter <- worker(bylines = F)
# 使用斷詞器斷詞(有兩種寫法)
#segment(content, cutter)
cutter[content]

new_words <- c("紐約商業交易所","探勘井","頁岩油","輕值原油")
# 一次只能加入一個詞，常常需要搭配迴圈使用
for (i in 1:length(new_words)) {
  new_user_word(cutter, new_words[i])
}

content <- str_remove_all(content, "[0-9a-zA-Z]+?")
cutter[content]

# 匯出新詞
new_words <- c("紐約商業交易所","探勘井","頁岩油","輕值原油")
writeLines(new_words, "new_words.txt")
# 設定停止詞
stop_words <- c("在","的","下","個","來","至","座","亦","與","或","日","月","年","週")
writeLines(stop_words, "stop_words.txt")
# 重新定義斷詞器，匯入停止詞
cutter <- worker(user = "new_words.txt", stop_word = "stop_words.txt", bylines = FALSE)
seg_words <- cutter[content]
seg_words

  
# 計算詞彙頻率 
txt_freq <- freq(x)
# 由大到小排列
txt_freq <- arrange(txt_freq, desc(freq))
txt_freq
# 檢查前6名
head(txt_freq)

par(family=("Microsoft YaHei")) #一般wordcloud需要定義字體，不然會無法顯示中文
# 一般的文字雲 (pkg: wordcloud)
wordcloud(txt_freq$char, txt_freq$freq, min.freq = 2, random.order = F, ordered.colors = F, colors = rainbow(nrow(txt_freq)))
# 互動式文字雲 (pkg: wordcloud2)
wordcloud2(filter(txt_freq, freq > 1), 
           minSize = 2, fontFamily = "Microsoft YaHei", size = 1)



