# 主要是基本的数据处理，
# 处理缺失值，处理日期型数据，数据类型的转换
# 对数据进行 排序，合并，筛选

manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08",
          "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country,
                         gender, age,q1, q2, q3, q4, q5,stringsAsFactors=FALSE)
						 
# 根据以上数据，问题是如何区别5个经理人的领导能力
# 为了回答以上问题，我们必须首先处理几个数据处理问题
# 五个指标(q1 到 q5)需要被合并，为每个经理人产生一个单独的分数
# 处理缺失值
# 从数据集中成百上千个变量中选取感兴趣的变量
# 领导力可能是管理者年龄的函数，你需要把当前的年龄分类到不同的年龄类别
# 限制时间在一个特定的时间段

#----------------------------R中的transform()函数------------------------
mydata <- data.frame(x1 = c(2,2,2,2), x2 = c(1,1,1,1))
# x1 x2
# 1  2  1
# 2  2  1
# 3  2  1
# 4  2  1
mydata <- transform(mydata, sumx = x1+x2, meanx = (x1+x2)/2)
mydata
# x1 x2 sumx meanx
# 1  2  1    3   1.5
# 2  2  1    3   1.5
# 3  2  1    3   1.5
# 4  2  1    3   1.5

## 从以上可以看出transform()函数的作用，就是在原来的数据框后添加新的列




#---------------------------R中的逻辑运算符-----------------------------
# 逻辑运算符中的< <= > >= == != 这6种就不在解释了
!x    #取非
x | y  #x和y里面有一个为真，则为真
x & y  #x和y必须全为真，才为真
isTRUE(x)   #检验x是否为真



#-----------------------数值型变量-->分类型变量------------------------
leadership$age[leadership$age == 99] <- NA
leadership$agecat[leadership$age > 75] <- "Elder"
leadership$agecat[leadership$age >= 55 & leadership$age <= 75] <- "Middle Aged"
leadership$agecat[leadership$age < 55] <- "Young"

# *有一个需要注意的地方就是，R的逻辑运算符不能  1<x<2 这种形式，
# 而要写成 1<x & x<2 不然error




#---------------------------如何处理无穷、缺失值(missing value)------------------------------
# 在R中，Inf 和 -Inf 分别代表正无穷和负无穷
# 像sin(Inf) 这样的未定值 使用符号NaN 表示，
# 为了确定这两种值，你需要使用 is.infinite()或者in.nan()两种函数来表示
is.nan(sin(Inf))
# [1] TRUE

## ========================如何处理NA值呢？============================
# 方法一：大多数数值型函数都有 na.rm = TRUE  的选项
# 方法二： na.omit()函数可以删除含有缺失值的任意一行





# -------------------------如何处理日期型数据？------------------------
## 函数 as.Date()可以用来把字符型字符串转化为日期型变量
## 语法是 as.Date(x,"input_format")
# %d    转换为数字型日期 如 05-29
# %a    转换为缩写的星期几  Mon
# %A    全称的星期几  Monday
# %m    数值型的月份  如00-12
# %b    缩写的月份    Jan
# %B    不缩写的月份  January
# %y    两位数的年份  21
# %Y    四位数的年份  2021

Sys.Date()    #  显示系统时间！！！
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")
dates
# [1] "1965-01-05" "1975-08-16"

# =================解决了整个问题中的时间类型转换问题=====================
myformat <- "%m/%d/%y"
leadership$date <- as.Date(leadership$date, myformat)

# =======================时间的减法！！！=============================
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2011-01-22")
days <- enddate - startdate
days
# Time difference of 2535 days





#----------------------数据类型的转换-----------------------------
## 就是as.numeric()和is.numeric()函数的转换
a <- c(1,2,3)
is.vector(a)
is.numeric(a)
b <- c("a","b","c")
is.vector(b)
is.numeric(b)
#### 看来vector类型和numeric类型还是有区别的

as.character(a)
# [1] "1" "2" "3"




#------------------------------数据排序----------------------------
## 使用Order()函数，默认的是升序排序
newdata <- leadership[order(leadership$age),]

## 那么如何对两个变量进行升序排列呢?
newdata <- leadership[order(gender,age),]
##### 千万不要忘了加上最后的逗号得到的结果就是个锤子

## 那么又如何使两个变量一个升序，一个降序呢？
newdata <-leadership[order(gender, -age),]



#----------------------------数据合并-----------------------------
## 如何按列融合一个新的数据框
total <- cbind(A, B)
total <- merge(dataframeA, dataframeB, by="ID")
total <- merge(dataframeA, dataframeB, by=c("ID","Country"))

## 如何按照行融合一个新的数据框
total <- rbind(dataframeA, dataframeB)




#-----------------R有强大的索引功能，可以访问数组中的元素-------------
# 选择变量： dataframe[row indices, column indices]
# newdata <- leadership[, c(6:10)]
# 去除变量
# newdata <- leadership[!myvars]
# 
# 选择或者去掉观测
# 取子集函数:     subset()
# 随机混合样本： sample()



#选择变量
newdata <- leadership[, c(6:10)]
newdata
myvars <- c("q1", "q2", "q3", "q4", "q5")
newdata <-leadership[myvars]
newdata
myvars <- paste("q", 1:5, sep="")
newdata <- leadership[myvars]
newdata
#除去变量
myvars <- names(leadership) %in% c("q3", "q4")
newdata <- leadership[!myvars]
newdata
newdata <- leadership[c(-7, -8)]
newdata
leadership$q3 <- leadership$q4 <- NULL

