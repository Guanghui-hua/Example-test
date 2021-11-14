# 使用R来做线性回归

## ===================准备数据===============
# 身高，单位 cm
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)

# 体重，单位 kg
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

## ================提交给lm()函数==========
# lm()函数，在R中用lm()做线性回归，lm()用于创建自变量和因变量之间的关系模型
relation <- lm(y~x)
print(relation)

# 使用 summary() 函数获取关系模型的概要:
print(summary(relation))


## ================使用predict()函数=========
# predict() 函数用于根据我们建立的模型来预测数值，predict() 函数语法格式  predict(object, newdata)
# 判断身高为170cm的体重
a <- data.frame(x=170)
result <- predict(relation,a)
print(result)

## ================生成图表 ===============

plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")

