x=1:6
x
x+3
x+6:7
seq(1:10)
seq(1,10, by=2)
seq(1,10, by=0.5)
seq(1,10,length.out = 4)
seq(0,100,length.out = 5)
x=c(1,5,4,9,3)
x
number=c(1,5,5,4,7,6)
baskets.NBA2016.Lin=c(7,8,6,11,9,12)
baskets.NBA2016.Lin
scores.NBA2016.Lin = baskets.NBA2016.Lin*2
scores.NBA2016.Lin
baskets.NBA2016.Jordon =c(10,5,9,12,7,11)
total= (baskets.NBA2016.Jordon+baskets.NBA2016.Lin)*2
total
all.baskets.NBA2016=c(baskets.NBA2016.Lin,baskets.NBA2016.Jordon)
all.baskets.NBA2016
rep(5,5)
rep(5, times=5)
rep(1:5,3)
rep(1:3,times=3,each=2)
rep(1:3,each=2,length.out=10)
x=numeric(10)
x
rep(numeric(10))
rep(numeric(10),times=3 ,each=2)
all.baskets.NBA2016= baskets.NBA2016.Jordon +
  baskets.NBA2016.Lin
all.baskets.NBA2016  
x=rep(1:5,times=2,
      each=2)
x
coffee.Knowledge="Coffee is mainly produced
+ in frigid regions."
coffee.Knowledge
baskets.NBA2016.Lin=c(7,8,6,11,9,12)
sum(baskets.NBA2016.Lin)
max(baskets.NBA2016.Lin)
min(baskets.NBA2016.Lin)
mean(baskets.NBA2016.Lin)
prod(1:5)
baskets.NBA2016.Jordon
cumsum(baskets.NBA2016.Jordon)
cumprod(baskets.NBA2016.Jordon)
cummax(baskets.NBA2016.Jordon)
cummin(baskets.NBA2016.Jordon)
diff(baskets.NBA2016.Jordon)
x=sample(1:100,8)
x
sort(x)
rank(x)
rev(x)
rank(x,na.last=FALSE)
rank(x*-1)
rank(-x)
rank(x)
x=c("Hello R World")
X.New=c('Hello R World')
X.new
