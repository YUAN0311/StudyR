.libPaths("D:/RStudio")
setwd("D:/RStudio/StudyR/應用練習")
#讀檔案
#此方法可讀，但結果會不一樣
dengue<- read.csv("dengue.csv",header=TRUE, stringsAsFactors=FALSE, fileEncoding = "UTF-8")
#網頁版本
dengue<- read.csv("dengue-20151107-big5.csv")
#str()觀察每個資料框的類型
str(dengue)
#summary()可以做簡單的敘述統計
summary(dengue)
#畫地圖
#install.packages("ggmap")
#install.packages("mapproj")
library(ggmap)
library(mapproj)
register_google(key = "AIzaSyChHEn5zbFdUV0xQXxclzjPU6wBOY5_20Q")
#location直接輸入地名，也可輸入經緯度
#zoom是地圖大小
#language是地圖文字語言
#maptype是地圖類型(常用：roadmap、satellite、hybrid、toner-lite)
#darken為地圖亮度
#geom_point為地圖的點
map <- get_map(location = "Taiwan", zoom = 7,
               language = "zh-TW", maptype = "roadmap")
ggmap(map, darken = c(0.5, "white")) +
  geom_point(aes(x = 經度座標, y = 緯度座標),
             color = "red", data = dengue)
#再畫一張比較大的圖
map <- get_map(location = "Tainan", zoom = 9,
               language = "zh-TW", maptype = "roadmap")
ggmap(map, darken = c(0.5, "white")) +
  geom_point(aes(x = 經度座標, y = 緯度座標),
             color = "red", data = dengue)
#透過圖形來訂出一個篩選資料的方形區域
map <- get_map(location = "Tainan", zoom = 9,
               language = "zh-TW", maptype = "roadmap")
ggmap(map, darken = c(0.5, "white")) +
  geom_point(aes(x = 經度座標, y = 緯度座標),
             color = "red", data = dengue) +
  geom_rect(aes(xmin = 120, xmax = 120.6, ymin = 22.8, ymax = 23.5),
            alpha = 0.1)#alpha為矩形透明度

#接著把實際的資料篩選出來：
filter.idx1 <- dengue$緯度座標 > 22.8 & dengue$緯度座標 < 23.5
filter.idx2 <- dengue$經度座標 > 120 & dengue$經度座標 < 120.6
dengue.tn <- dengue[filter.idx1 & filter.idx2, ]
dengue.tn
#把篩選好的資料畫在地圖上：臺南市全年的登革熱病例分佈地圖。
map <- get_map(location = c(lon = 120.246100, lat = 23.121198),
               zoom = 10, language = "zh-TW")
ggmap(map, darken = c(0.5, "white")) +
  geom_point(aes(x = 經度座標, y = 緯度座標),
             color = "red", data = dengue.tn)
#從上面 dengue 的 summary 輸出中可以看到行政區的名稱有一些問題，我們將 dengue.tn$區別 的 levels 列出來看一下：
#levels 只能用在factor
levels(dengue.tn$區別)
dengue.tn$區別
#修改區別
dengue.tn[dengue.tn$區別 == "北　區", ]$區別 <- "北區"
dengue.tn[dengue.tn$區別 == "東　區", ]$區別 <- "東區"
dengue.tn[dengue.tn$區別 == "南　區" | dengue.tn$區別 == "南    區", ]$區別 <- "南區"
dengue.tn[dengue.tn$區別 == "永康區 ", ]$區別 <- "永康區"
#重新建立一次 factor，這樣可以將空的 levels 去掉
dengue.tn$區別 <- factor(dengue.tn$區別)
#然後再確認一次區別名稱
levels(dengue.tn$區別)
#畫出每週登革熱的病例數統計圖
#hist是直方圖
#break間格
#freq百分比
hist(as.Date(dengue.tn$確診日), breaks = "weeks",
     freq = TRUE, main = "登革熱每週病例數", xlab = "日期",
     ylab = "病例數", format = "%m/%d")
hist(as.Date(dengue.tn$確診日), breaks = "weeks",
     freq = F, main = "登革熱每週病例數", xlab = "日期",
     ylab = "病例數", format = "%m/%d")
#計算每個月的登革熱病例數
dengue.tn$month <- format(as.Date(dengue.tn$確診日), "%m")
#table樞紐分析
table(dengue.tn$month)
barplot(table(dengue.tn$month), xlab = "月份", ylab = "病例數",
        main = "登革熱每月病例數")
#也可以使用 ggplot2 來畫
library(ggplot2)
library(scales)
ggplot(dengue.tn, aes(x=as.Date(確診日))) +
  stat_bin(binwidth=7, position="identity") +
  scale_x_date(breaks=date_breaks(width="1 month")) +
  theme(axis.text.x = element_text(angle=90)) +
  xlab("日期") + ylab("病例數") +
  ggtitle("登革熱每週病例數")
#分析疫情最嚴重的區域。計算各個行政區的病例總數：
dengue.region.summary <- sort(summary(dengue.tn$區別), decreasing = FALSE)
dengue.region.summary
barplot(dengue.region.summary, las = 2, horiz = TRUE,
        main = "各行政區病例統計", xlab = "病例數")
pie(dengue.region.summary)
#將最嚴重的五個行政區病例資料篩選出來
dengue.top.reg <- dengue.tn[
  dengue.tn$區別 == "北區" |
    dengue.tn$區別 == "中西區" |
    dengue.tn$區別 == "南區" |
    dengue.tn$區別 == "東區" |
    dengue.tn$區別 == "永康區", ]
ggplot(dengue.top.reg, aes(x=as.Date(確診日))) +
  stat_bin(binwidth=7, position="identity") +
  scale_x_date(breaks=date_breaks(width="1 month")) +
  theme(axis.text.x = element_text(angle=90)) +
  xlab("日期") + ylab("病例數") +
  ggtitle("登革熱每週病例數") + facet_grid(區別 ~ .)
#依照月份來畫圖(??)
ggplot(dengue.top.reg, aes(x=as.Date(確診日))) +
  stat_bin(breaks=as.numeric(seq(as.Date('2015-1-1'),
                                 as.Date('2015-12-1'), '1 month')), position="identity") +
  scale_x_date(breaks=date_breaks(width="1 month")) +
  theme(axis.text.x = element_text(angle=90)) +
  xlab("日期") + ylab("病例數") +
  ggtitle("登革熱每月病例數") + facet_grid(區別 ~ .)
#依據月份區分，畫出每個月的登革熱病例分佈地圖
map <- get_map(location = c(lon = 120.246100, lat = 23.121198),
               zoom = 10, language = "zh-TW")
ggmap(map, darken = c(0.5, "white")) +
  geom_point(aes(x = 經度座標, y = 緯度座標),
             color = "red", data = dengue.tn) +
  facet_wrap(~ month)
#假設某人居住在台南市，其住家的經緯度座標為 (22.997088, 120.201771)，而登革熱病媒蚊飛行活動範圍可遠至 400 ～ 800 公尺的地區，將此人住家 400 公尺以內的病例資料篩選出來，觀察每個月的疫情變化。這是計算地球上兩點之間距離的函數，輸入兩點的經緯度，可以計算出兩點之間的距離，單位為公里
earthDist <- function (lon1, lat1, lon2, lat2){
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- lon1 * rad
  b1 <- lat2 * rad
  b2 <- lon2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}
#篩選出 400 公尺以內的病例資料
home.pos <- c(22.997088, 120.201771) # (緯度, 經度)
home.dist <- earthDist(dengue.tn$經度座標, dengue.tn$緯度座標, home.pos[2],  home.pos[1])
home.idx <- home.dist <= 0.4;
dengue.home <- dengue.tn[home.idx, ]
#查看每個月狀況
table(dengue.home$month)
barplot(table(dengue.home$month), xlab = "月份", ylab = "病例數",
        main = "登革熱每月病例數（特定區域）")
#每個月的病例分佈：
map <- get_map(location = c(lon = home.pos[2], lat = home.pos[1]),
               zoom = 16, language = "zh-TW", color = "bw")
ggmap(map) +
  geom_point(aes(x = 經度座標, y = 緯度座標),
             color = "red", data = dengue.home, size = 5) +
  facet_wrap(~ month)
#由於經緯度資料的精確度不足，造成大量的資料點重疊，因此改用 jitter 的方式畫圖
map <- get_map(location = c(lon = home.pos[2], lat = home.pos[1]),
               zoom = 16, language = "zh-TW", color = "bw")
ggmap(map) +
  geom_jitter(aes(x = 經度座標, y = 緯度座標),
              size = 3, position = position_jitter(w = 0.0005, h = 0.0005),
              data = dengue.home, color = "red") +
  facet_wrap(~ month)
#假設今天是 2015 年 9 月 15 日，在地圖上畫出此人住家 400 公尺以內，2 週之內新增的病例分佈地圖。篩選出此人住家 400 公尺以內，兩週之內新增的病例
dengue.home$day.diff <- as.numeric(as.Date(dengue.home$確診日) - as.Date("2015/09/15"))
dengue.home.subset <- dengue.home[dengue.home$day.diff >= 0 & dengue.home$day.diff < 14, ]
#依照時間決定顏色畫圖：
map <- get_map(location = c(lon = home.pos[2], lat = home.pos[1]),
zoom = 16, language = "zh-TW", color = "bw")
ggmap(map) +
  geom_jitter(aes(x = 經度座標, y = 緯度座標, color = day.diff),
              size = 3, position = position_jitter(w = 0.0005, h = 0.0005),
              data = dengue.home.subset) +
  scale_colour_gradientn(colours=heat.colors(3))
