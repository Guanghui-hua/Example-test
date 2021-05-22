###基本画图方法
#画图一次增加一条命令，增加feature直到你想要的样子
#使用R画图主要就是两种画图命令----High level ones & Low level ones
# 高级画图函数例如 plot(),hist(),curves(),boxplot()
# 低级画图函数例如 line(),abline()
#--------R的画图秘诀就是使用高级画图命令  加上  几个低级画图命令




attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)













#---------------------条形图&直方图&核密度图&箱线图&小提琴图-----------------------------
library(vcd)
attach(Arthritis)
counts<-table(Improved,Treatment)  #table可以计算频数

##ggplot可以画出来3D图


#stack barplot
barplot(counts,
        main = "Stacked Bar Plot",  
        col=c('red','yellow','blue'))
#注意main要使用双引号，不然会报错


# 水平条形图
barplot(counts,main= "Simple Bar Plot",
        xlab = 'Improvement',ylab='Frequency',horiz=TRUE)

plot(Improved,main="Simple Bar Plot",
     xlab="Improved",ylab="Frequency")

plot(Improved,horiz=TRUE,main="Horiziontal Bar Plot",
     ylab="Improved",xlab="Frequency")





### 堆砌条形图
barplot(counts,
        main="Stacked Bar Plot",
        xlab="Treament",ylab="Frequency",
        col = c("red","yellow","green"),
        legend=rownames(counts))

barplot(counts,
        main="Grouped Bar Plot",
        xlab="Treament",ylab="Frequency",
        col = c("red","yellow","green"),
        legend=rownames(counts),beside = TRUE)
detach(Arthritis)

#-Bar plot for sorted mean values
attach(states)
detach(states)
states<-data.frame(state.region,state.x77)
means<-aggregate(states$Illiteracy,
                 by=list(state.region),FUN=mean)
means
means<-means[order(means$x),]

barplot(means$x,names.arg = means$Group.1)
title("Mean Illiteracy Rate")

library(vcd)
attach(Arthritis)
counts<-table(Treament,Improved)
spine(counts,main="Spinogram Example")  #棘状图
detach(Arthritis)

#扇形图
par(mforw(2,2))
slices<-c(10,12.4,16,8)
lbls<-c("us","UK","Australia","Germany","France")
pie(slices,labels = lbls,
    main="Simple Pie Chart")

#带百分比
pct<-round(slices/sum(slices)*100)
lbls2<-paste(lbls," ",pct,"%",sep="")
pie(slices,labels=lbls2,col=rainbow(length(lbls2)),
    main="Pie Chart with Percentages")

library(plotrix)
pie3D(slices, labels=lbls,explode=0.1,
      main="3D Pie Chart ")

#带上频数
mytable<-table(state.region)
lbls3<-paste(names(mytable),"\n",mytable,sep = "")
pie(mytable,labels=lbls3,
    main="Pie Chart from a Table \n (with sample sizes)")


library(plotrix)
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slices, labels = lbls, main="Fan Plot")

#简单直方图实例
hist(mtcars$mpg)

#对直方图进行区间设置，柱子的粗细
hist(mtcars$mpg,
     breaks=12, #breaks对区间进行区分
     col="red",
     xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")

#y轴前面是频数，现在是频率
hist(mtcars$mpg,
     freq=FALSE,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Histogram, rug plot, density curve")
#rug()函数可以在下面显示频数
rug(jitter(mtcars$mpg))
#加上密度曲线
lines(density(mtcars$mpg), col="blue", lwd=2)

#如果刻度不匹配
hist(mtcars$mpg,
     breaks=12, #breaks对区间进行区分
     col="red",
     xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")
lines(density(mtcars$mpg), col="blue", lwd=2)  #利用非参数估计来算出来核密度图
#刻度不匹配


x <- mtcars$mpg
h<-hist(x,breaks=12,
        col="red",
        xlab="Miles Per Gallon",
        main="Histogram with normal curve and box")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)  #密度函数值转化为频数,
lines(xfit, yfit, col="blue", lwd=2)
box()


# Listing 6.7 - Kernel density plot 画核密度曲线
d <- density(mtcars$mpg) # returns the density data
plot(d) # plots the results
d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")  #加上title
polygon(d, col="red", border="blue")  #填充颜色
rug(mtcars$mpg, col="brown") #x轴上带上频数


# Listing 6.8 - Comparing kernel density plots#不同的核密度比较
par(lwd=2)
library(sm)  #利用sm包可以同时画多条核密度图
attach(mtcars)
# create value labels
cyl.f <- factor(mtcars$cyl, levels= c(4, 6, 8),
                labels = c("4 cylinder", "6 cylinder", "8 cylinder"))


# plot densities
library(sm)
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

# add legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f))))
cat("Use mouse to place legend...","\n\n")
legend(locator(1), levels(cyl.f), fill=colfill)  #由鼠标位置添加图例
detach(mtcars)
par(lwd=1)



### 箱线图  显示四分位数和奇异值
# parallel box plots
boxplot(mpg~cyl,data=mtcars,
        main="Car Milage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

# notched box plots  #花里胡哨，丑的一匹
boxplot(mpg~cyl,data=mtcars,
        notch=TRUE,
        varwidth=TRUE,
        col="red",
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

# Listing 6.9 - Box plots for two crossed factors
# create a factor for number of cylinders
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels=c(4,6,8),
                       labels=c("4","6","8"))
# create a factor for transmission type
mtcars$am.f <- factor(mtcars$am,
                      levels=c(0,1),
                      labels=c("auto","standard"))
# generate boxplot
boxplot(mpg ~ am.f *cyl.f,
        data=mtcars,
        varwidth=TRUE,
        col=c("gold", "darkgreen"),
        main="MPG Distribution by Auto Type",
        xlab="Auto Type")


# Listing 6.10 - Violin plots   小提琴图
library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3,
        names=c("4 cyl", "6 cyl", "8 cyl"),
        col="gold")
title("Violin Plots of Miles Per Gallon")

# dot chart
dotchart(mtcars$mpg,labels=row.names(mtcars),cex=.7,
         main="Gas Mileage for Car Models",
         xlab="Miles Per Gallon")



# Listing 6.11 - Dot plot grouped, sorted, and colored
#样本量要小一点，太大了没有效果
x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         pch=19,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon")



