library(lattice)
a<-  -10:10
b <- -10:10
eg<-  expand.grid(x=a, y=b)
eg$z <- eg$x^2+eg$y^2
wireframe(z ~ x + y, eg)
