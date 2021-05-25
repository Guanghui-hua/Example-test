#qplot()是ggplot2的姐妹？？？

x <- seq(0,2*pi,0.01)
y <- sin(x)
library(ggplot2)
dev.new()
qplot(x,y,col = "red")




##查到的一个可以用来学习的网址  https://zhuanlan.zhihu.com/p/29447771
#在ggplot2中，图是通过串联起来的("+")来创建的，每个函数修改属于自己的部分

ggplot(data=mtcars, aes(x=wt,y=mpg))+geom_point(col="green")+geom_smooth(method = "lm",lty=2,col="red")

#可以看两张图片的对比
attach(mtcars)
plot(wt,mpg)
grid()