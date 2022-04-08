dataset = read.csv("Gross.csv")
weight = dataset[,5]
amount = dataset[,6]
data = data.frame(weight,amount)
View(data)
str(data)
library(caTools)
set.seed(211)
split = sample.split(data$amount,SplitRatio = 0.8)
View(split)
training_set = subset(data,split==TRUE)
testing_set = subset(data,split==FALSE)
View(training_set)
View(testing_set)

regressor = lm(formula = amount~weight,data = training_set)

y_pred = predict(regressor,newdata = testing_set)
a = testing_set$amount
b = y_pred

plot(testing_set$weight,a,type='p',col='blue',xlab = 'Count',ylab='red')
lines(testing_set$weight,b,type = 'o',col='red')

