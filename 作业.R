x <- c(1,1,2,2,3,3,3)
w <- c("张三","李四","王五","赵六","张一","李七","王九")
y <- c("女","男","男","女","女","女","男")
u<- c("10/24/2008", "10/28/2009", "10/1/2007",
      "10/12/2008", "5/1/2009","3/1/2007","6/24/2008")
Z1 <- c(80,85,92,76,61,95,83)
Z2 <- c(82,80,82,86,71,98,NA)

#1. 将x,w,y,u,z 构成一个名为infTable 的dataframe, 变量依次重命名为class,name,sex,birthD,Math,English。将infTable 中有NA 取值的记录删除掉。
infTable<-data.frame(class=x,name=w,sex=y,birthD=u,Math=Z1,English=Z2)
infTable<-na.omit(infTable)

#2. 在infTable 中创建新的变量年龄age，平均分数meanScore 以及成绩等第meanScorecat:90及以上的为excellent,80 及以上且90 以下的为good,80 以下的为pass，
myformat<-"%m/%d/%Y"
infTable$age<-as.Date(infTable$birthD,myformat)
infTable$age<-as.integer(round((Sys.Date()-as.Date(infTable$birthD,myformat))/365))
infTable<-transform(infTable, meanScore=(Math+English)/2)
infTable$meanScorecat[infTable$meanScore>=90]<-'excellent'
infTable$meanScorecat[infTable$meanScore>=80 & infTable$meanScore<90]<-'good'
infTable$meanScorecat[infTable$meanScore<80]<-'pass'
#3. 将infTable 按照meanScore 从小到大的顺序排列；按照meanScore，age 从小到大的顺序排序;按照meanScore 从小到大的顺序,age 从大到小的顺序。
attach(infTable)
infTable1<-infTable[order(infTable$meanScore),]
infTable2<-infTable[order(infTable$meanScore,infTable$age),]
infTable3<-infTable[order(meanScore,-age),]
detach(infTable)

x <- c(1,1,2,2,3,3,3)
w <- c("张三","李四","王五","赵六","张一","李七","王九")
y <- c("女","男","男","女","女","女","男")
u<- c("10/24/2008", "10/28/2009", "10/1/2007",
      "10/12/2008", "5/1/2009","3/1/2007","6/24/2008")
Chinese<- c(81,83,91,78,65,85,83)

#去掉infTable 中的meanScore 和meanScorecat 变量，然后把infTable 和infTablech 两个数据框合并为一个包括班级、姓名、性别、birthD、age、Math,English、Chinese 的数据框，
#数据框命名为inftotal，选取inftotal 数据框中语数英成绩都为80 分以上的学生的信息；再从inftotal数据框中随机的选取两名学生的有关信息。
infTablech<-data.frame(class=x,name=w,sex=y,birthD=u,Chinese)
infTable$meanScore<-infTable$meanScorecat<-NULL
infTablech1<-infTablech[(1:6),]
inftotal<-merge(infTable,infTablech1,by=c('class','name','sex','birthD'))
stuinfo<-inftotal[which(inftotal$Math>80 & inftotal$Chinese>80 & inftotal$English>80),]
mysample <- inftotal[sample(1:nrow(inftotal),2,
                              replace=FALSE),]
#5、在一幅图形中画出inftotal 中的语文、数学、英语的折线图。
x<-inftotal[[5]]
y<-inftotal[[6]]
z<-inftotal[[8]]
kedu<-seq(60,100,5)
opar<-par(no.readonly = TRUE)
plot(x,type='b',col='red',lty=1, pch=1, lwd=2,xaxt='n',yaxt='n',ann = FALSE)#,ylim=c(60, 100))
par(new=TRUE)
plot(y,type='b',col='green',lty=2, pch=4, lwd=2,xaxt='n',yaxt='n',ann = FALSE)#,ylim=c(60, 100))
par(new=TRUE)
plot(z,type='b',col='blue',lty=4, pch=2, lwd=2,xaxt='n',yaxt='n',ann = FALSE)#,ylim=c(60, 100))
axis(2, at=kedu, labels=kedu, las=2)
axis(1, at=c(1,2,3,4,5,6), labels=c("张三","李四","王五","赵六","张一","李七"), las=0)
title('Grade line chart',
      xlab='Name',
      ylab='Grades')
usr <- par('usr')
xx <- usr[2]*1.02 #图例左上角的x坐标
yy <- usr[4]*0.6 #图例左上角的y坐标
legend('bottomleft',legend=c('Math','English','Chinese'),
       lty=c(1,2,4),pch=c(1,4,2),col=c('red','green','blue'),cex=0.3)
par(opar)
