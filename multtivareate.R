
#librarys
library(scatterplot3d)
library(corrplot)

#data

x2=matrix(c(45,70,30,90,55,60,20,80,40,100,35,65,50,75,25,
            12,35,5,40,18,22,3,30,10,50,80,28,15,35,7,
            2,5,1,5,3,4,0,6,1,7,2,5,3,6,1),byrow=F,ncol=3)

#time=time spent in social media(in min), 
#interaction=likes comment at that time in posts,
# followers = percntage of success follower who like posts

colnames(x2)=c('time','interations','followers')

#mean vector,and sigma matrix
mu=colMeans(x2)
sigma=cov(x2)

#normality check
shapiro.test(x2[,1])
shapiro.test(x2[,2])
shapiro.test(x2[,3])

#normality graph
par(mfrow=c(1,3))

hist(x2[,1],prob=T)
curve(dnorm(x,mean(x2[,1]),sd(x2[,1])),add=T,col='red')

hist(x2[,2],prob=T)
curve(dnorm(x,mean(x2[,2]),sd(x2[,2])),add=T,col='red')

hist(x2[,3],prob=T)
curve(dnorm(x,mean(x2[,3]),sd(x2[,3])),add=T,col='red')


#scatter plot for multivariate data
scatterplot3d(x2[,1],x2[,2],x2[,3])

#user enter conditional
x=scan(n=1)

#if user enter 1
if(x==1){
  mu1<-mu[2:3]
  mu2<-mu[1]
  # arrangment of sigma matrix
  s=matrix(0,3,3)
  s[,1]=c(sigma[2,2],sigma[2,3],sigma[2,1])
  s[,2]=c(sigma[3,2],sigma[3,3],sigma[3,1])
  s[,3]=c(sigma[1,2],sigma[1,3],sigma[1,1])
  
  sigma11<-s[1:2,1:2]
  sigma12<-s[1:2,3,drop=FALSE]
  sigma21<-t(sigma12)
  sigma22<-s[3,3]
  
}

#if user enter 2
if(x==2){
  mu1<-c(mu[1],mu[3])
  mu2<-mu[2]
  # arrangment of sigma matrix
  s=matrix(0,3,3)
  s[,1]=c(sigma[1,1],sigma[1,3],sigma[1,2])
  s[,2]=c(sigma[3,1],sigma[3,3],sigma[3,2])
  s[,3]=c(sigma[2,1],sigma[2,3],sigma[2,2])
  
  sigma11<-s[1:2,1:2]
  sigma12<-s[1:2,3,drop=FALSE]
  sigma21<-t(sigma12)
  sigma22<-s[3,3]
  
}

#if user enter 3
if(x==3){
  mu1<-mu[1:2]
  mu2<-mu[3]
  # arrangment of sigma matrix
  sigma11<-sigma[1:2,1:2]
  sigma12<-sigma[1:2,3,drop=FALSE]
  sigma21<-t(sigma12)
  sigma22<-sigma[3,3]
  
}

#checking the mean and partial sigma matrix is correctly entered

mu
mu1
mu2

sigma
sigma11
sigma12
sigma21
sigma22

#conditional mean and covariance
#By putting value of x3 we can find mean
#x3=2 or x3=c(3,4)
cond_mean<-mu1+ Sigma12 %*%solve(Sigma22) %*% (x3-mu2)
cov_cond=sigma11-sigma12%*%solve(sigma22)%*%sigma21
cov_cond

#conditional correlation
cor(cov_cond)

#correlation plot
corrplot(cor(cov_cond))


