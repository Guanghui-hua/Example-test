# 1.把程序直接放入括号中可以直接显示
(t<-1:10)


# 2.科学计数法问题
#  > cumprod(x)
#[1] 2.000000e+00 1.800000e+01 2.880000e+02 2.880000e+03 3.168000e+04 3.801600e+05 4.942080e+06
options(scipen=100)   #小数点100位以内不使用科学计数法
options(digits = 3)   #保留小数点后三位
#执行以上命令后，结果为
#  > cumprod(x)
# [1] 2 18  288  2880 31680 380160

# 3.没想过的赋值方法
A<-B<-matrix(1:20,nrow=4,ncol=5,byrow = FALSE,dimnames = NULL)   #这种赋值方式！！！

# 4. 在工作路径时注意使用   两个斜杠    以防止反义字符的作用

# 5. 选中注释内容后使用Ctrl+Shift+C可以将所选内容全部注释掉

#6. 清除工作环境中的所有变量
rm(list=ls())
rm()函数


#7. 实用函数
length(x)	        #返回对象x的长度
seq(from,to,by)	  #生成序列
rep(x,n)	        #将x重复n次
cut(x,n)	        #连续变量离散化。选项ordered_result=TRUE
pretty(x,n)	      #创建美观的分割点。选取n+1等间距的取整数，将连续变量x分割为n个区间
#cat(…,file=‘myfile’,append=TRUE)	  #将…中的对象，将其输出到屏幕或文件中。


#下面是例子
x<-seq(1,20,2)
length(x)
y<-rep(3,10)
cut(x,4)  #把向量分成4个水平的因子
pretty(c(2,4),10)  #注意输入的应该是一个包含首尾的两个向量，以表示连续向量


#scale()函数
#scale函数是将一组数进行处理，默认情况下是将一组数的每个数都减去这组数的平均值后再除以这组数的均方根。
#> scale(ss,scale=FALSE)   直接减去均值，没有除以均方根
#> scale(ss,center=FALSE)  没有减去均值，直接除以均方根
newdata <- scale(mydata)

#transform()函数  作用：为原数据框添加新的列，改变原变量列的值，还可通过赋值NULL删除列变量
newdata=transform(newdata,t=c(1:6))
transform(newdata,t=NULL)
#注意这里面的transform()函数不会改变原来数据框，如果想要改变原来数据框，需要赋值才行



