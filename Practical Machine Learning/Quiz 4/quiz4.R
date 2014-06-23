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