library(reshape2)
library (pastecs)
library(dplyr)
library(e1071)
library(ggplot2)
library(stats)

data <- read.csv("C:/Users/vivia/OneDrive/Documents/GitHub/class material/classmaterial/class 2/ANOVA/ERWaiting/data/ERWaiting.csv")
names(data)

summary.data=rbind( 
  sapply(data,mean), 
  sapply(data,sd), 
  sapply(data,var), 
  sapply(data,quantile),
  sapply(data,kurtosis),
  sapply(data,skewness))
row.names(summary.data)=c("mean","sd","var","Min","q1","median","q3","Max","Kurt","Skew") 
View(summary.data)
print(summary.data)

erdata.melt <- melt(data, id ="day")
erdata.melt

fit1 = aov(value ~ as.factor(variable), erdata.melt)
fit1
fit1.aov.summary <- summary(fit1)
fit1.aov.summary

erdata.tukey <- TukeyHSD(fit1)
erdata.tukey



