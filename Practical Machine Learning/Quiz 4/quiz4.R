# Question 1

library(ElemStatLearn)
library(caret)
data(vowel.train)
data(vowel.test)
training <- vowel.train
training$y <- factor(training$y)
testing <- vowel.test
testing$y <- factor(testing$y)

set.seed(33833)
modFitrf <- train(y ~ ., data=training, method="rf")
set.seed(33833)
modFitgbm <- train(y ~ ., data=training, method="gbm")
predrf <- predict(modFitrf, testing)
predgbm <- predict(modFitgbm, testing)
cm1rf <- confusionMatrix(predrf,testing$y)
cm1gbm <- confusionMatrix(predgbm,testing$y)
agreement <- (predrf == predgbm)
sum(agreement)/length(agreement)

# Question 2

set.seed(3433)
library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
set.seed(62433)
modFitrf <- train(diagnosis ~ ., data=training, method="rf")
predrf <- predict(modFitrf, testing)
set.seed(62433)
modFitgbm <- train(diagnosis ~ ., data=training, method="gbm")
predgbm <- predict(modFitgbm, testing)
set.seed(62433)
modFitlda<- train(diagnosis ~ ., data=training, method="lda")
predlda <- predict(modFitlda, testing)
pred_comb <- data.frame (predrf, predgbm, predlda, diagnosis=testing$diagnosis)
comb_modFitrf <- train(diagnosis ~ ., method="rf", data = pred_comb)
pred_stacked <- predict(comb_modFitrf, testing)
confusionMatrix(pred_stacked,testing$diagnosis)
confusionMatrix(predrf, testing$diagnosis)
confusionMatrix(predgbm, testing$diagnosis)
confusionMatrix(predlda, testing$diagnosis)

# Question 3

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
set.seed(233)
modFit<-train(CompressiveStrength~.,data=training, method="lasso")
object <- enet(x=as.matrix(subset(training, select=-c(CompressiveStrength))), y=training$CompressiveStrength, lambda=0)
plot(object,xvar="penalty")

# Question 4

library(lubridate)
library(forecast)
dat = read.csv("gaData.csv")
training = dat[year(dat$date)==2011,]
testing = dat[year(dat$date)>2011,]
tstrain = ts(training$visitsTumblr)
modBats <- bats(tstrain)
pred <- forecast(modBats, h=length(testing$visitsTumblr),level=c(80,95))
accuracy <- 1-sum(testing$visitsTumblr>pred$upper[,2])/length(testing$visitsTumblr)

# Question 5
library(e1071)
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
svm.model <- svm(CompressiveStrength ~ ., data = training)
svm.pred  <- predict(svm.model, testing)
accuracy(svm.pred, testing$CompressiveStrength)