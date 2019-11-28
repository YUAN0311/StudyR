install.packages("jiebaR")
install.packages('Rwordseg')
# [在R中使用結巴分詞](https://blog.yjtseng.info/post/jiebar/)
library(jiebaR) #載入jiebaR package
cutter <- worker()
cutter["知名連鎖咖啡品牌西雅圖，涉嫌將低價豆混充成100%阿拉比卡豆名義在市面上販售"]
cutter["台灣老字號食品公司「金車」旗下商品多到數不清，如奧利多水、伯朗咖啡及麥根沙士等，至今仍受許多民眾喜愛。"]
cutter <- worker(user="user.dict.utf8","tag")
x=cutter["知名連鎖咖啡品牌西雅圖，涉嫌將低價豆混充成100%阿拉比卡豆名義在市面上販售"]
x
names(x)
class(x)
str(x)
s=c("知名","連鎖","咖啡","品牌")
names(s) <- c("v","vn","n","n")
segment("台灣老字號食品公司「金車」旗下商品多到數不清，如奧利多水、伯朗咖啡及麥根沙士等，至今仍受許多民眾喜愛。",cutter)
cutter[c("台灣老字號食品公司「金車」旗下商品多到數不清","如奧利多水、伯朗咖啡及麥根沙士等，至今仍受許多民眾喜愛。")]
