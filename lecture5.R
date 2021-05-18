# _*_ coding:utf-8 _*_
rm(list=ls())   #清空变量

### 现在有一些学生有数学、科学、英语三门课的成绩
### 我们想要组合这些成绩来表示这些学生的成绩
### 我们想要前20%得A,然后20%得B,然后依次  -->筛选
### 最后,我们想要按字母排序  -->排序


Student <- c("John Davis", "Angela Williams",
             "Bullwinkle Moose","David Jones", "Janice Markhammer",
             "Cheryl Cushing","Reuven Ytzrhak", "Greg Knox",
             "Joel England","Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English,
                     stringsAsFactors=FALSE)  
#roster的意思是名册，而rooster的意思是公鸡



#-----------------------------数学函数-----------------------------------
num=-pi
abs(num)  #取绝对值
sqrt(4)  #开平方运算
ceiling(num)  #向上取整
floor(num)    #向下取整,很好理解，floor意思是地板，所以向下取整
trunc(num)   #truncate是截短的意思
round(pi,digits = 3)  #按照小数点后面保留
signif(pi,digits=3)   #按照所有的数字进行保留
sin(pi)  #结果是1.224606e-16
#为了让结果不是科学计数法，使用下面的代码
options(scipen = 100)  #使小数点100位以内不适用科学计数法
help(options)  #设置影响计算以及结果的**全局**的变量


sin(pi) #结果已经变为0.0000000000000001224606
cos(pi);tan(pi)         #三角函数
asin(1);acos(1);atan(1) #反三角函数
cosh(1);sinh(1);tanh(1) #什么函数给忘了！？
acosh(1);asinh(1);atanh(1)
log(exp(1));log2(2);log10(10)  #三种比较常用的对数函数
log(3,3)  #以3为底的对数

exp(1)  #指数函数
#--------------------------统计函数--------------------------------
vec<-c(1,2,3,4)
mean(vec) #求均值
median(vec)  #求中位数
sd(vec)  #修正的样本标准差
var(vec)  #修正的样本方差
mad(vec)  #中值绝对偏差
quantile(vec,c(0.5,1))  #求分位数
range(vec)  #求极值
sum(vec)  #求和
min(vec)  #求最小值
max(vec)  #求最大值


vec<-c(1,1,2,3,5,8,13,21,34)
diff(vec) #差分，后面一位减去前面一位
diff(vec,lag=2)  #差分，第n+2位减去第n位
diff(vec,lag = 3)  #差分，第n+3位减去第n位


#+++++++++++scale()函数，来进行标准化处理，使得数据去量纲容易比较+++++++++++++
#scale函数是将一组数进行处理，默认情况下是将一组数的每个数都减去这组数的平均值后再除以这组数的均方根。
#> scale(vec,scale=FALSE)   直接减去均值，没有除以均方根
#> scale(vec,center=FALSE)  没有减去均值，直接除以均方根
scale(vec,center = TRUE,scale = TRUE)

#——-------------------------概率函数-------------------------------------
#在R里面，概率函数使用形式     [dbqr]distribution_abbreviation()    
#d 代表密度
#b 表示分布函数
#q 四分位数功能
#r 随机产生
#beta--------Beta分布
#binom-------二项分布
#cauthy-----柯西分布
#chisq------卡方分布
#exp--------指数分布
#gamma------伽马分布
#geom-------几何分布
#hyper------超几何分布
#lnorm------对数正态
#logis------Logistic分布     Logistic分布指当n趋向于无穷大时，从指数分布(exponential distribution)中抽取的容量n的随机样本的最大与最小样本值的平均的极限分布
#multinom---多项分布
#nbinom----负二项式分布，也即帕斯卡分布  假设一串独立的伯努利实验（0-1，成功失败，伯努利实验），每次实验（trial）成功和失败的概率分别是 p 和 1−p。
#实验将会一直重复下去，直到实验失败了 r 次。定义全部实验中成功的次数为随机变量 X
#norm------正态分布
#pios-------泊松分布
#t----------t分布
#unif-------均匀分布
#weibull----威布尔分布

###两种非参数检验方法
#signrank---威尔科克森符号秩检验
#weicox-----wilcoxon signed sum   秩和检验

#画标准正态分布
#区间[-3,3]
x <- pretty(c(-3,3), 30)
y <- dnorm(x)
plot(x, y,type = "l",xlab = "Normal Deviate",
ylab = "Density",yaxs = "i")


#标准正态分布z=1.96左侧面积是
pnorm(1.96)    #等于 0.975

#x~N(500,10)求分位数
qnorm(0.9,mean=500,sd=100)    #等于628.16

#产生50个服从正态分布的随机数
rnorm(50, mean=50, sd=10)
rnorm(50)


#为随机数生成器选择随机种子
#从均匀分布中产生伪随机数
runif(5)  #[0,1]均匀分布中产生5个随机数

set.seed(1234)  #设置随机数种子
runif(5)
set.seed(1234)
runif(5)
runif(5)
runif(5)
#**************注意随机数种子设置一次有效，所以如果想要随机数相同我们需要每次设置随机种子
#-------------------------------字符函数----------------------------------------------------
x="My name is Gray"
nchar(x)  #返回字符串中的元素个数
substr(x,1,2)  #substr(string,start,stop)  #既可以提取字符串，还可以替换！！！！！！
substr(x,1,2)<-"His"   #注意如果传入的值多了，会选择前面的匹配
print(x)

grep("A",c("b","A","c"),fixed=TRUE)
#grep(pattern,x,ignore.case=FALSE,fixed = TRUE)
# 在x中寻找pattern，pattern是一个正则表达式，如果fixed = TRUE，那么Pattern是一个文本字符串
# 返回的是匹配的x的切片

sub("\\s",".","Hello There") #会返回   Hello.There.  
sub(pattern,replacement,x,ignore.case=FALSE,fixed=FALSE) 
#实现字符串的替换功能
#注意 \s 是一个正则表达式  表示空格，为什么使用 \\s 而不是直接使用 \s　因为斜杠是R的转义字符 (Escape character)

y<-strsplit("abc","")
print(y)
#strsplit(x,split,fixed=FALSE)
#分字符向量x的元素，如果fixed=FALSE,那么Pattern一个正则表达式,
#如果fixed=TRUE,那么Pattern是一个文本字符串
unlist(y)[2];sapply(y,"[",2)
#注意  这两种方法是一样的


paste("x",1:3,sep="")
paste("x",1:3,"M")        #"x 1 M" "x 2 M" "x 3 M"
paste("x",1:3,sep = "M")  #"xM1" "xM2" "xM3"
#请注意上面两种写法的不同
paste("Today is ",date())
#paste(...,sep=  )
#实现粘合的功能

toupper("abc")  #返回大写
tolower("ABC")  #返回小写


#---------------------有关正则表达式----------------------------------------
#注意到grep() sub() strsplit() 能够寻找文本字符串(fixed=TRUE)或者一个正则表达式(fixed=FALSE)，FALSE是默认值
#正则表达式提供了一个清楚和精确的语法对于在文本格式中匹配一个格式
#比如正则表达式  ^[hc]?at   匹配任何字符串以 h 或者 c 或者 空值 开始，接着at的字符串，
#所以能够匹配hat,cat,at但是不能匹配bat

#---------------------其他有用的函数-------------------------------------
lenth(x)  #返回对象的长度

#seq(from,to,by) 产生一个序列

#rep(x,n)  对x重复n次

#cut(x,n) 把连续变量x分成n个水平的因子，产生一个有顺序的因子

#pretty(x,n)  产生断点，把随机变量x分成，通过选择n+1个相等间隔的舍入值将连续变量x分为n个间隔。 常用于绘图

#cat(...,file="myfile",append = FALSE)










#%%%%%%%%%%%%%%%%R中的apply()函数和sapply()函数%%%%%%%%%%%%
a <- matrix(1:9,nrow=3)
##生成3 x 3的矩阵
apply(a,1,min)
apply(a,2,min)
##对a数据框进行apply运算。其中，1表示按行计算，2表示按列计算，同时也可以算更高维的数据，比如数组或者矩阵。min表示最小值（还有其他的参数）,运算结果如下图所示。
x=c(1:5)
sapply(x,function(x) {x^2})
##计算x从1-5的平方，并返回数值。
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#---------------------------------------------------------------------------------------------
#实例
a<-5
sqrt(5)
b<-c(1.243,5.645,2.99)
round(b)
c<-matrix(runif(12),nrow=3)
log(c)
mean(c)

mydata<-matrix(rnorm(30),nrow=6)
apply(mydata,1,mean)
apply(mydata,2,mean)
apply(mydata,2,mean,trim=0.4)






#---------------------------------------------------------------------------------------------

z <- scale(roster[,2:4])
score <- apply(z, 1, mean)
roster <- cbind(roster, score)
y <- quantile(score, c(.8,.6,.4,.2))
roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"
name <- strsplit((roster$Student), " ")
Lastname <- sapply(name, "[", 2)
Firstname <- sapply(name, "[", 1)
roster <- cbind(Firstname,Lastname, roster[,-1])
roster <- roster[order(Lastname,Firstname),]


(roster)


for(i in 1:10)print('Hello')


i<-5
while(i>0){print('Hello');i=i-1}

#if (is.character(grade)) grade <- as.factor(grade)


#(Numercial and character functions)  #数值与字符函数
x=-324.32423
abs(x)
sqrt(x)
ceiling(x)
floor(x)
trunc(x)
round(x,digits=3)
signif(x,digits=4)

x=pi
sin(x)

x=seq(1,10,by=2)  #如何生成一个序列

#scale()函数
#scale函数是将一组数进行处理，默认情况下是将一组数的每个数都减去这组数的平均值后再除以这组数的均方根。
#> scale(ss,scale=FALSE)   直接减去均值，没有除以均方根
#> scale(ss,center=FALSE)  没有减去均值，直接除以均方根
newdata <- scale(mydata)

#transform()函数  作用：为原数据框添加新的列，改变原变量列的值，还可通过赋值NULL删除列变量
newdata=transform(newdata,t=c(1:6))
transform(newdata,t=NULL)
#注意这里面的transform()函数不会改变原来数据框，如果想要改变原来数据框，需要赋值才行



#绘制标准正态曲线
x <- pretty(c(-3,3), 30)
y <- dnorm(x)
plot(x, y,type = "l",xlab = "Normal Deviate",ylab = "Density",yaxs = "i")

pnorm(1.96)  #根据z值可以查看在这一点左侧的面积
qnorm(.9, mean=500, sd=100)

rnorm(50, mean=50, sd=10)  #生成服从标准正态的随机数，且可以指定均值和方差



c<-matrix(runif(12),nrow=3)
mydata<-matrix(rnorm(30),nrow=6)
(mydata)
apply(mydata,2,mean)
apply(mydata,2,mean,trim=.4)
