# _*_ coding:utf-8 _*_
rm(list=ls())   #清空变量

### 现在有一些学生有数学、科学、英语三门课的成绩
### 我们想要综合这些成绩来表示这些学生的成绩
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
quantile(vec,c(0.5,1))  #按照区间两端点的值按照比例进行进行划分，返回划分区间的间断点
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
rnorm(50, mean=50, sd=10) #生成服从标准正态的随机数，且可以指定均值和方差

rnorm(50)
mydata <- matrix(rnorm(30), nrow=6)

#为随机数生成器选择随机种子
#从均匀分布中产生伪随机数
runif(5)  #[0,1]均匀分布中产生5个随机数
x <- matrix(runif(12), nrow =3 )


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

indices <- seq(1,10,2)
#seq(from,to,by) 产生一个序列

rep(1:3,2)
#rep(x,n)  对x重复n次


#cut(x,n) 也就是可以进行  分箱  操作
#cut():切割将x的范围划分为时间间隔，并根据其所处的时间间隔对x中的值进行编码。
#参数：breaks:两个或更多个唯一切割点或单个数字（大于或等于2）的数字向量，给出x被切割的间隔的个数。
#breaks:采用fivenum():返回五个数据：最小值、下四分位数、中位数、上四分位数、最大值。
#labels：为区间数，打标签
#ordered_result:逻辑：结果应该是一个有序的因素吗？
demo <- runif(10)
break1 <- fivenum(demo)
label <- c("D","c","B","A")
cut(demo,break1,labels = label,ordered_result = T)
# [1] A    c    B    A    D    B    <NA> c    D    B   
# Levels: D < c < B < A

demo <- 1:10
pretty(demo,4)
#pretty(x,n)  选取n+1等间距的取整数，将连续变量x分割为n个区间
#%%%%%%%%%%%%%%%从这里可以看出cut()函数和pretty()函数的区别%%%%%%%%%%%%%%%%
#cut()函数是按照序列的值进行划分，区间是序列中的值，而且区间是左开右闭的，所以一定会有一个NA值，这个值就是序列中的最小值
#pretty()函数是按照长度划分的，是均等划分



name <- "Gray"
cat("Hello",name,"\n")
#Hello Gray 

paste("Hello",name,"\n")
#[1] "Hello Gray \n"

cat(" i=",1,"\n")
cat(" i=",1,sep = "  to be or not to be  ")
cat(paste(letters, 100* 1:26), fill = TRUE, labels = paste0("{", 1:10, "}:"))
#cat(...,file="myfile",append = FALSE)
format(c(1,2,3))
#format()函数可以把一个数值向量转化为字符型

#%%%%%%%%%%%%%%%%R中的apply()函数和sapply()函数%%%%%%%%%%%%
a <- matrix(1:9,nrow=3)
##生成3 x 3的矩阵
apply(a,1,min)
apply(a,2,min)
##对a数据框进行apply运算。其中，1表示按行计算，2表示按列计算，同时也可以算更高维的数据，比如数组或者矩阵。min表示最小值（还有其他的参数）,运算结果如下图所示。
x=c(1:5)
sapply(x,function(x) {x^2})
##计算x从1-5的平方，并返回数值。


#+++++++++++apply作用于matrix,而sapply作用于向量或者列表


### 1. apply

#当需要将特定的函数运用于结构化的数据块时，结构化的指的是某种矩阵格式。
#例如：
m <- matrix(data=cbind(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5)), nrow=30, ncol=3)
apply(m, 2, mean)
#[1] -0.02664418  1.95812458 4.86857792

#apply(m, 2, mean) 是将mean函数应用与矩阵 m 的列上，参数 2 指列（1 指行）。

可#以自定义函数：
apply(m, 2, function(x) length(x[x<0]))
#[1] 14  1  0

#其中，function(x) length(x[x<0]) 即是自定函数。

# 2. sapply 和 lapply

#这两个函数的功能和用法比较相似，作用于如向量或列表的数据集合上。
#举一个sapply的例子，sapply作用于向量或列表：
sapply(1:3, function(x) x^2)
#[1] 1 4 9

#lapply 比较相似，不过lapply的输出是一个列表而不是向量
lapply(1:3, function(x) x^2)
#[[1]]
#[1] 1
#
#[[2]]
#[1] 4
#
#[[3]]
#[1] 9

#sapply和lapply的区别可以通过对函数添加参数来消除：
#在sapply函数的参数中添加 simplify=FALSE 即可使函数结果为list格式

sapply(1:3, function(x) x^2, simplify=F)
#[[1]]
#[1] 1
#
#[[2]]
#[1] 4
#
#[[3]]
#[1] 9

#在lapply函数外围在使用unlist函数即可使lapply函数结果为向量格式

unlist(lapply(1:3, function(x) x^2))
#[1] 1 4 9

#3. 两种函数功能的相互转化：

sapply(1:3, function(x) mean(m[,x]))
#[1] -0.02664418  1.95812458 4.86857792

sapply(1:3, function(x, y) mean(y[,x]), y=m)
#[1] -0.02664418  1.95812458 4.86857792

#这两个函数功能和 apply(m, 2, function(x) length(x[x<0])) 相同。
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mydata<-matrix(rnorm(30),nrow=6)
apply(mydata,1,mean)
apply(mydata,2,mean)
apply(mydata,2,mean,trim=0.4)
#mean()是不稳健的，trim可以去掉前后20%的极值
#而trim参数的含义是：修剪掉排在首尾的部分数据，其实就是去除异常值以后再进行求均值。
#trim 的中文翻译就是   修剪，修整   的意思


#----------------------------数据管理挑战的解决办法-----------------------------------------------------------------

Student <- c("John Davis", "Angela Williams",
             "Bullwinkle Moose","David Jones", "Janice Markhammer",
             "Cheryl Cushing","Reuven Ytzrhak", "Greg Knox",
             "Joel England","Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English,
                     stringsAsFactors=FALSE)  

#把学生成绩进行分级
z <- scale(roster[,2:4])  #标准化处理
score <- apply(z, 1, mean)  #标准化处理后按列求均值（注意这里没有加权）
roster <- cbind(roster, score)
y <- quantile(score, c(.8,.6,.4,.2)) #按照区间两端点的值按照比例进行进行划分，返回划分区间的间断点
roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"



### 接下来是为了完成按照字母进行排序
name <- strsplit((roster$Student), " ")
Lastname <- sapply(name, "[", 2)
Firstname <- sapply(name, "[", 1)
# "["是一个函数,可以提取对象的一部分，注意strsplit()函数返回的是一个列表，所以sapply()是提取了name这个列表的第一个成分或者第二个成分

roster <- cbind(Firstname,Lastname, roster[,-1])
#可以利用函数cbind() 和rbind() 把向量和矩阵拼成一个新的矩阵。
#概略地说，cbind() 把矩阵横向合并成一个大矩阵（列方式），而rbind()是纵向合并（行方式）。

roster <- roster[order(Lastname,Firstname),]



#------------控制流(Control flow) R中程序也是按照一条一条执行，但是有时候我们需要改变顺序--------------

## statement statement,我觉得就是语句的意思 是一个单独的R语句一个复杂的语句（一组R的声明放在花括号里面并且被分号分开）
## cond      cond 是判断TRUE或者FALSE
## expr      expr 是计算数字或者字符串的一种语句
## seq       seq 是一列数字或者字符串

#============================looping constructs======================
#looping construct-->循环构造    重复执行
#loop是循环，环形的意思
#looping constructs 重复执行一条语句知道条件为FALSE
## for  
###for循环重复执行一条语句直到一条语句不在包含一个序列seq中的值
###while: 一个while循环重复执行一条语句直到条件不再是TRUE
  
for(i in 1:10)print("Hello world!")
i<5
while(i>0){print("Hello world!");i<-i-1}

#==========================conditional execution======================
#在Conditional execution中，只有满足特定的条件语句才能被执行
##if-else语法是
# if (cond) statement
# if (cond) statement1 else statement2


grade=61
if(grade>60)print("Passed")else print("Failed")
#[1] "Passed"
outcome <- if(grade>60)print("Passed")else print("Failed")
#[1] "Passed"
print(outcome)
#[1] "Passed"
grade="91"
if(is.character(grade))grade<-as.factor(grade)  #如果grade是字符型变为因子型
if(!is.factor(grade))grade<-as.factor(grade)else print("already a factor ")  #如果factor不是因子型那么就变为因子型，如果是因子型就输出"already a factor"

####我觉得这个ifelse完全就是个鸡肋函数，不记也罢
##ifelse:  ifelse结构是一个复杂的向量化的if-else结构
##ifelse语法是
##ifelse(cond,statement1,statement2)
##不过看起来好像ifelse中statement只能有两条
#这个ifelse怪的很，如果不赋值的话，就会输出两次，搞不懂
ifelse(grade>60,print("Passed"),print("Failed"))
# [1] "Passed"
# [1] "Passed"
outcome <- ifelse(grade>60,print("Passed"),print("Failed"))
#[1] "Passed"



#%%%%%%%%%%%%%%%%%%%%%%%%我感觉关于条件判断更重要的下面这条语句%%%%%%%%%%%%%%%%%%%
#if(cond){statement}
# else if(cond){statement}
# else if(cond){statement}
# else if(cond){statement}
# else{statement}

#如果90+  A
#80~90    B
#70~80    C
#60~70    D
#60-      Failed


#错误示范
# gradeL<-function(grade){ 
#   if(grade>=90){
#     result="A"
#   }else if(80<=grade<90){
#     result="B"
#   }
#   else if(70<=grade<80){
#     result="C"
#   }else if(60<=grade<70){
#    result="D"
#   }else{result="Failed"}
#   return(result)
# }
# 总是报错，原来是因为在R中70<=grade<80这样表达式是错误的
# 需要写成70<=grade&grade<80



gradeLevel <- function(grade){
if(grade>=90){
    result="A"
  }
else if(80<=grade&grade<90){
    result="B"
  }
else if(70<=grade&grade<80){
    result="C"
  }
else if(60<=grade&grade<70){
    result="D"
}
else{result="Failed"}
return(result)
}

gradeLevel(99)
gradeLevel(88)
gradeLevel(77)
gradeLevel(66)
gradeLevel(55)


#***********************switch实际上是一个函数*******************************
##switch: switch基于表达式的值来执行语句
##switch语法结构是
##switch(expr,...)
##expr是参数的表达式，其值可以是数字或者字符串；
##我觉得把switch()翻译成“闸”很合适
##根据expr的值来  “开闸” 
##后面的...可以可以认为是一个列表，根据expr的值来确定输出...中的哪一个值， 


#如果expr计算出来是一个整数值，那么switch()返回后面的...的位置的值
switch(2,"python","C++","R","Java")

#当...这个list中的元素是有名字的定义时，当expr等于元素名时，返回变量名对应的值，否则没有返回值
type="a"
switch(type,
       "a"="Hello world",
       "b"="Fucking world")

func1 <- function(type){
  switch(type,
         A="Hello world",
         B="Fucking world")
}

#-----------------------函数function---------------------------------------------
##函数的结构看起来
##myfunction<-function(arg1,arg2,...){
##	statements
##	return(object)
##}


mystats <- function(x, parametric=TRUE, print=FALSE) {
if (parametric) {
center <- mean(x); spread <- sd(x)
} else {
center <- median(x); spread <- mad(x)
}
if (print & parametric) {
cat("Mean=", center, "\n", "SD=", spread, "\n")
} else if (print & !parametric) {
cat("Median=", center, "\n", "MAD=", spread, "\n")
}
result <- list(center=center, spread=spread)
return(result)
}
# trying it out
set.seed(1234)
x <- rnorm(500)
y <- mystats(x)
y <- mystats(x, parametric=FALSE, print=TRUE)
# Another switch example
mydate <- function(type="long") {
switch(type,
long = format(Sys.time(), "%A %B %d %Y"),
short = format(Sys.time(), "%m-%d-%y"),
cat(type, "is not a recognized type\n"))
}
mydate("long")
mydate("short")
mydate()
mydate("medium")



g.data=function(modeu,modeq,b0,b1,g1,err,x,AA){
if(modeu=="l"& modeq=="ls")
Y=1+x%*%b0+2*(x%*%g1*AA)+err
if(modeu=="l"& modeq=="ee")
Y=1+x%*%b0+(exp(x%*%g1)-1)*AA+err
if(modeu=="s"& modeq=="cb")
Y=1+sin(pi*x%*%b0)+0.5*(x%*%b1)^2+(x%*%g1)^3*AA+err
if(modeu=="it"& modeq=="cb")
Y=1+(x[,1]*x[,2]+0.5*x[,3]^2)+(x%*%g1)^3*AA+err
return(Y)
}

gamma0=c(1,1,-1,1)
beta0=c(1,-1,1,1)
beta1=c(1,0,-1,0)
modeut=c("l","s","it")
modeqt=c("ls","cb","ee")
nu=1;nq=1
pii1=0.5
n=200
p=length(beta0)
pp=seq(1:p)
rho=0
R=rho^abs(matrix(kronecker(pp,pp,FUN="-"),p,p))
set.seed(123451*nu*nq)
X=matrix(rnorm(n*p),n,p) %*% t(chol(R))
Xtilde=cbind(rep(1,n),X)
A=rbinom(n,1,pii1)
err=rnorm(n,0,0.5)
pii=mean(A)
Api=A/pii
Y=g.data(modeut[nu],modeqt[nq],beta0,beta1,gamma0,err,X,A)



#------------------------aggregation and reshaping 聚合和重塑---------------------
## transpose  转置 t()
## 聚合数据   aggregate(x,by,FUN)
cars <- mtcars[1:5, 1:4]
View(cars)
t(cars)
options(digits=3)
attach(mtcars)
View(mtcars)
View(cyl)
View(gear)
aggdata <-aggregate(mtcars, by=list(cyl,gear),FUN=mean, na.rm=TRUE)
View(aggdata)

##melting

##casting


#------------------------transform()函数------------------------------------------
#transform()函数  作用：为原数据框添加新的列，改变原变量列的值，还可通过赋值NULL删除列变量
newdata=transform(newdata,t=c(1:6))
transform(newdata,t=NULL)
#注意这里面的transform()函数不会改变原来数据框，如果想要改变原来数据框，需要赋值才行



