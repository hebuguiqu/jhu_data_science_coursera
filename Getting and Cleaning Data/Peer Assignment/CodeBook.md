Peer Assessment Codebook
=================================================
This file describes the variables, the data, and modifications performed on the data.  
* Data was obtained from:  
** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones        
** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R file performs the following:
** Reads X_train.txt, y_train.txt and subject_train.txt from the train folder and stores them in trainData, trainLabel and trainSubject.
** Reads X_test.txt, y_test.txt and subject_test.txt from the test folder and stores them in testData, testLabel and testSubject.
** Concatenates testData to trainData into joinedData. 
** Concatenates testLabel to trainLabel into joinedLabel. 
** Concatenates testSubject to trainSubject into joinedSubject.  
** Reads features.txt into features.
** Cleans the column names of the subset.   
** Reads activity_labels.txt file into activity.  
** Cleans the activity names
** Transform the values of joinedLabel.
** Combines joinedSubject, joinedLabel, and joinedData into cleanedData.
** Writes cleanedData out to merged_data.txt.
** Generates a second data set with the average of each measurement for each activity and each subject. This is stored in result.
** Writes result to data_with_means.txt.