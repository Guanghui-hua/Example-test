##我的理解，注意高级函数，低级函数，使用par()函数对刻度、文字大小、图的线形和点的种类等的设置
##三种配合使用

#----------------------#基本画图方法--------------------------------------------------------

#画图一次增加一条命令，增加feature直到你想要的样子

#使用R基本的画图函数有两种画图命令----High level ones & Low level ones

# 高级画图函数例如 plot(),hist(),curves(),boxplot()

# 低级画图函数例如 line(),abline()

#示例需要用到的数据
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

#--------一个示例-------------------

dev.new()  #使用这个命令可以是图像跳出来而不是在右下角显示
attach(mtcars)
plot(wt,mpg,col="red")
grid(lwd=3)
abline(lm(mpg~wt),col="blue")  #看来高级函数和低级函数都可以设置颜色
title("Regression of MPG on Weight")
detach(mtcars)


#---------------------------dev.set(dev.next())的作用------------------------------------------------------
##通过下面这个例子搞清楚dev.off()函数和dev.set()和dev.next()都有什么作用
dev.new()  ####看来这个dev.new()和x11()实现的功能是一样的！！！都是生成一张什么都没有的画布
x11()      #生成一个画布
plot(1:10) #画点

x11()      #生成第二张画布
plot(rnorm(10))      #画第二张图，是随机的10个点

dev.set(dev.prev())  #设置第一张图
abline(0, 1)        #画穿过1：10的线

dev.set(dev.next()) #开始设置另一张图
abline(h = 0, col = "gray") #画一条灰色的参考线

dev.set(dev.prev())   #返回继续设置前面一张图片，不然后面dev.off()只能对最后一张图片起作用

dev.off()
dev.off() #同时关闭两张图片

#-----------------------设置图形参数------------------------------------------------
## 有两种设置图形参数的方法
###==========================通过par()函数=====================
dev.new()
opar<-par(no.readonly = TRUE)
par(lty=2)     #控制连线类型
par(pch=17)    #控制绘图符号类型
par(bg="white")  #控制背景颜色
par(cex.axis=0.5)  #控制坐标轴刻度
#par(mfcol = c(2,2))  #按照列分割绘图窗口
#par(ps=1.5)
#par(mfrow = c(2,3))
##par(type = "b")  
#报错了，看来par()函数并不能设置type参数
#plot(dose,drugA,type = "b")
plot(dose,drugA,type = "b")
par(opar)

###=========================通过高级画图函数提供的optionsName=value的方式
plot(dose,drugA,lty = 2,pch = 17,type = "b" )
plot(dose,drugA,lty = 2,pch = 17,type = "S" )  #阶梯形，没见过...
#但是高级画图函数有时候并不能提供所有参数

####=====================R中basic画图用到的函数&参数=============================================
# R中常用的几个高级绘图函数
# plot(x,y)       #绘制x与y的二元图
# pair(x,y)       #多维数据的成对散点图
# coplot(x,y|z)   #关于z的每个数值绘制x与y的二元图
# matplot(x,y)    #二元图，其中x的列对应y的相应的列
# boxplot(x,y)
# barplot(x,y)
# hist(x,y)
# qqnorm(x)
# qqplot(x,y)
# contour(x,y,z)
# filled.contour(x,y,z)
# persp(x,y,z)
# 
# 高级绘图函数的选项及缺省值
# 
# add=FALSE      #如果是TRUE 那么叠加到前一个图上
# axes=TRUE      #FALSE  不绘制轴与边框
# yaxt='n'       #不显示y轴刻度线和刻度标签，只留下纵轴的框架
# xaxt = "n"     #不显示x轴刻度线和刻度标签，只留下横轴的框架
# ann=FALSE  #会调用函数plot.default使对坐标轴名称、整体图像名称不做任何注解。默认值为TRUE。
# xlim=, ylim=   #指定坐标轴的上下限
# xlab=, ylab=   #坐标轴的标签（字符型）
# main=          #主标题（字符型）
# sub=           #副标题（小写，字符型）
# type="p"       #指定图形的类型
# "l"------------线
# "p"------------点
# "b"------------点连线
# "o"------------点连线，但是线在点上
# "h"------------垂直线
# "s"------------阶梯式，垂直线顶端显示数据
# "S"------------阶梯式，但是在垂直线底端显示数据
# 
# 
# 常用的低级绘图函数
# 注意，低级绘图函数一定要放在高级绘图函数的后面，不然会显示不出来
# points(x,y)   #添加点
# lines(x,y)    #添加线
# curve(expr,...)   #添加曲线
# text(x,y,labels,...) #在(x,y)处添加文字
# mtext(text,side=3,line=0,...)  #在边空添加文字
# abline(a,b)   #绘制斜率为b和截距为a的直线
# abline(h=y)   #在纵坐标y处画水平线
# abline(v=x)   #在横坐标x处画垂直线
# *******************************感觉这个厉害了----> abline(lm.obj) #画由线性回归对象lm.obj确定的回归线
# legend(x,y,legend) #在点经（x,y)添加图例
# title()       #添加标题，也可以添加一个副标题
# axis(side,vect)  #画坐标轴
# box()         #在当前的图上加上边框
# rug(x)        #在x-轴上用短线画出x数据的位置，应该就是表示频数的那个函数
# 
# 
# 绘图函数的参数说明，help(par)中可以得到绘图参数（73个）的说明
# par() 会永久地改变绘图参数，所以经常加上以下语句
# opar <-par(no.readonly=TRUE)  #记录下par()地默认参数
# par(opar)  #绘图完毕之后，恢复默认参数
# 常用的绘图参数
# mar    #设置边距参数和背景数
# pin    #用于控制图形的大小 例如par(pin = c(2,3))  表示图形的长宽之比为x轴为2，y轴为3
# bg     #指定背景色
# cex    #控制符号和文字大小的值
# 	cex.axis  #控制坐标轴刻度数字大小
# 	cex.lab   #控制坐标轴标签文字大小
# 	cex.main  #控制标题文字大小
# 	cex.sub   #控制副标题文字大小
# font   #控制文字字体的整数，还可用于axis,lab,main,sub
###### lty    #控制连线的线型 可以试一下1,2,3,4,5,6各是什么类型
# lwd    #控制连线宽度
# mar= c(bottom,left,top,right)    #控制图形四侧的空行数
# mfcol = c(nr,nc)    #按列分割绘图窗口为nr行nc列
# mfrow = c(nr,nc)    #按行分割绘图窗口为nr行nc列
###### pch    #控制绘图符号的类型 
# ps     #控制文字大小的整数，单位为磅(points)

#下面这两个没有试验明白
# xlog   #设定x轴为普通(FALSE),还是对数坐标(TRUE)
# ylog   #设定y轴为普通(FALSE),还是对数坐标(TRUE)


#=============================layout()函数==========================
# 关于画图中的layout()函数
#参数matrix()是矩阵，非0数字代表绘制图形的**顺序**，相同数字代表占位符；
#”0”代表空缺，不绘制图形
#后面的数字表示生成一个什么样的整体图形，以矩阵形式表达
#byrow意思是默认按列生成，参数是TRUE则是按行生成

#绘制的是3行2列的图像，矩阵按行排序
attach(mtcars)
layout(matrix(c(1,1,2,0,3,4), 3, 2,byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
hist(carb)
detach(mtcars)


#绘制的是3行2列，按列排序
dev.new()
attach(mtcars)
layout(matrix(c(1,1,2,0,3,4), 3, 2))
hist(wt)
hist(mpg)
hist(disp)
hist(carb)
detach(mtcars)

##一共有3*2=6个格子，所以前面必须有6个数字，数字表示要画的图的序号
##3行2列我可以认为是一共有6个格子，那些数字意思就是图片的序号
##按列排序，那么第一个图占据第一列的前两个格子，
##第二个图占据第一列的第三个格子
##第三个图占据第二列第二个格子


#===================图例legend()中的参数============================
#### legend()函数添加参数的几种方式
# 1. 通过"toright"等内置位置
# 可以把"toright"换成"bottomright" "bottom" 
# "bottomleft" "left" "topleft" "top" "right" "center"
# 2. 通过设置坐标x,y
#我们可以通过画参考线的方法来设置来确定x大致合理的位置
# 3. 通过设置locator(1)参数通过鼠标在图中选
# 我们还可以通过legend中自带的locator(1)参数，通过点选图上的位置来放置图例。

####  ncol参数： 默认设定为1
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
boxplot(mpg ~ cyl, data=mtcars, 
        xlab = "cyl, number of car cylinders", 
        ylab = "mpg, miles per gallon", 
        col = rainbow(nlevels(mtcars$cyl)))
legend("topright", 
       legend=as.character(levels(mtcars$cyl)),
       fill = rainbow(nlevels(mtcars$cyl)), 
       title = "cyl", 
       ncol=nlevels(mtcars$cyl)) # nlevels(mtcars$cyl)=3


#### bty参数：将bty设定为"n"可以去掉图例外围的方框。
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
boxplot(mpg ~ cyl, data=mtcars, 
        xlab = "cyl, number of car cylinders", 
        ylab = "mpg, miles per gallon", 
        col = rainbow(nlevels(mtcars$cyl)))
legend("topright", 
       legend=as.character(levels(mtcars$cyl)),
       fill = rainbow(nlevels(mtcars$cyl)), 
       title = "cyl", 
       bty="n")
#### fill参数：可以用于填充图例当中颜色。这些颜色需要于图中(如boxplot)的一致。

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
boxplot(mpg ~ cyl, data=mtcars, 
        xlab = "cyl, number of car cylinders", 
        ylab = "mpg, miles per gallon", 
        col = c("red","yellow","blue"))
legend("topright", 
       legend=as.character(levels(mtcars$cyl)),
       fill = c("red","yellow","blue")) #要与boxplot中的col参数一致



#============================关于Hmisc包=====================================
# R语言中的图形一般情况下，只有主刻度线，没有**次要刻度线**；
# 如果要创建次要刻度线，需要使用Hmisc第三方包中的函数
library(Hmisc)  
minor.tick(nx=3,ny=3,tick.ratio=0.5)

#---------------------条形图&直方图&核密度图&箱线图&小提琴图-----------------------------
library(vcd)
attach(Arthritis)
counts<-table(Improved,Treatment)  #table可以计算频数

plot(Improved,main="Simple Bar Plot",
     xlab="Improved",ylab="Frequency")

plot(Improved,horiz=TRUE,main="Horiziontal Bar Plot",
     ylab="Improved",xlab="Frequency")
  

### 堆砌条形图
barplot(counts,
        main="Stacked Bar Plot",   #注意main要使用双引号，不然会报错
        xlab="Treament",ylab="Frequency",
        col = c("red","yellow","green"),
        legend=rownames(counts))
# 水平堆栈条形图
barplot(counts,main= "Simple Bar Plot",
        xlab = 'Improvement',ylab='Frequency',horiz=TRUE)

##通过beside参数变得很不一样，变成两个类似直方图一样的东西
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



