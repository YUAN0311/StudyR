.libPaths("D:/RStudio")
setwd("D:/RStudio/StudyR/應用練習")
200%%6

200%/%6

8>7
8<7
8=7
8==7

3^2
3%%2
3/2

my_height=159
my_weight=62
my_height
my_weight
bmi=my_weight/(my_height/100)^2
bmi
Sys.Date()+10
Sys.time()+10

name="apple"
name
beyond_start=as.Date("1983-12-31")
as.integer(beyond_start)
a=days_diff=Sys.Date()-beyond_start
years_diff=a/365
years_diff
2020-1983
%b
B%
a="1999-09-21 01:47:16"
b="1999-09-21 01:57:15"
c=b-a
a=as.POSIXct(a)
b=as.POSIXct(b)
b-a
a=seq(from=7,to=77,by=7)
a
b=paste(a,collapse=",")
b
print(b)
paste(a,sep="")
x

a=c("b","d","e")
a_f=factor(a,ordered = T,levels = c("e","b","d"))
a_f
weekdays=c("Monday","Tuesday","Wednesday","Thursday","Friday")
favorite_day=weekdays=="Friday"
weekdays[favorite_day]
not_blue_monday=weekdays!="Monday"
without_monday=weekdays[not_blue_monday]
without_monday
speed_char=c("slow","fast")
speed_factor=factor(speed_char,ordered = T,levels = c("fast","slow"))
speed_factor

a=c("Apple","Cake")
b=c(1,0)
c=c(20,40)
d=c(T,F)
e=c("20-15","16-7")
f=data.frame(a,b,c,d,e)
f
View(f)
str(f)
a=matrix(1:9,nrow = 3)
a[2,3]
b=a%%2==1
b
a[b]
a=array(1:20,dim=c(2,2,5))
a
a=array(1:1000,dim=c(10,10,10))
a
a[5,2,4]
title="worst nba teams"
teams=c("a","b")
wins=c(7,9)
losses=c(59,73)
worst_nba_teams=list(title=title,teams=teams,wins=wins,losses=losses)
worst_nba_teams
worst_nba_teams$wins
worst_nba_teams[[3]]
log11(1)
a="I eat Apple"
substr(a,start=7,stop = 11)
a=c("i","j","k")
grep(pattern = "k",a)
sub(pattern = "k",replacement = "a",a)
paste(c("a","b","c"),sep = ",")
a="a"
b="b"
c="c"
paste(a,b,c)
paste(a,b,c,sep = "")

a=1:9
mean(a)
a=c(a,NA)
mean(a)
mean(a,na.rm = T)
a=c(1,3,4,4,3,9)
asd(a)
a
sum(a)
sd(a)
median(a)
pi
ceiling(pi)
floor(pi)
round(pi,digits = 2)
a="Today is:"
sys_date=Sys.Date()
paste(a,sys_date)
a=c(11:14,NA)
sum(a,na.rm = T)
median(a,na.rm = T)
