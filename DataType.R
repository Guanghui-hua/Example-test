# R中主要的数据类型有
# 向量<矩阵<数组<数据框<列表
# vector<matrix<array<dataframe<list 
### 最后还有一种不是很熟悉的table类型







#table类型
test <- c(1,2,3,2,1,1,5,6,4,5,1)
test
#[1] 1 2 3 2 1 1 5 6 4 5 1
test1 <- table(test)
test1
#test
# 1 2 3 4 5 6   #test中的元素
# 4 2 1 1 2 1   #各个元素出现的频率
#1.提取table()中的元素
names(test1)
#[1] "1" "2" "3" "4" "5" "6"
#2.提取table()中的频率
as.numeric(test1)
#[1] 4 2 1 1 2 1
#3.进阶，提取table()中指定频率的数据，可先用as.data.frame()转换
test2 <- as.data.frame(test1)
test2
# test Freq
# 1    1    4
# 2    2    2
# 3    3    1
# 4    4    1
# 5    5    2
# 6    6    1
test2[which(test2$Freq==1),]  #提取出现频率为1的元素
# test Freq
# 3    3    1
# 4    4    1
# 6    6    1