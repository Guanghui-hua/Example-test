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


#7.原来R中也是又缩进的，另起一行就相当于一个；的作用，具体看例子
i=1;while(i<10){print("Hello world");i=i+1}
i=1;while(i<10){print("Hello world")
  i=i+1}
#以上两个都可以执行，下面这个就会报错
i=1;while(i<10){print("Hello world")i=i+1}
#错误: unexpected symbol in "while(i<10){print("Hello world")i"

