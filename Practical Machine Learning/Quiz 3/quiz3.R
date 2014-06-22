# Question 1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
inTrain1 <- createDataPartition(y=segmentationOriginal$Case, p=1, list=FALSE)
training1 <- segmentationOriginal[inTrain1,]
testing1 <- segmentationOriginal[-inTrain1,]
set.seed(125)
modelFit1 <- train(Class ~.,data=training1,method="rpart")
print(modelFit1$finalModel)
library(rattle)
fancyRpartPlot(modelFit1$finalModel)

# Question 2
#See slides 6,7,8 of Lecture 8 - Cross Validation

# Question 3
library(pgmm) #note: need to download manually
data(olive)
olive = olive[,-1]
modelFit3 <- rpart(Area ~.,data=olive)
newdata <- as.data.frame(t(colMeans(olive)))
predict(modelFit3,newdata)

# Question 4
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
set.seed(13234)
modelFit4 <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, data = trainSA, method="glm", family="binomial")
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
testPred <- predict(modelFit4,testSA)
missClass(testSA$chd,testPred)
trainPred <- predict(modelFit4,trainSA)
missClass(trainSA$chd,trainPred)

# Question 5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)