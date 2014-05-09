trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("UCI HAR Dataset//train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
joinedData <- rbind(trainData, testData)
joinedLabel <- rbind(trainLabel, testLabel)
joinedSubject <- rbind(trainSubject, testSubject)

features <- read.table("UCI HAR Dataset/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinedData <- joinedData[, meanStdIndices]
names(joinedData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(joinedData) <- gsub("mean", "Mean", names(joinedData))
names(joinedData) <- gsub("std", "Std", names(joinedData))
names(joinedData) <- gsub("-", "", names(joinedData))

activity <- read.table("UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinedLabel[, 1], 2]
joinedLabel[, 1] <- activityLabel
names(joinedLabel) <- "activity"

names(joinedSubject) <- "subject"
cleanedData <- cbind(joinedSubject, joinedLabel, joinedData)
write.table(cleanedData, "merged_data.txt")

subjectLen <- length(table(joinedSubject))
activityLen <- dim(activity)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(joinedSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
write.table(result, "data_with_means.txt")
