#You should create one R script called run_analysis.R that does the following. 
#1Merges the training and the test sets to create one data set.
#1Extracts only the measurements on the mean and standard deviation for each measurement. 
#2Uses descriptive activity names to name the activities in the data set
#2Appropriately labels the data set with descriptive variable names. 
#4 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Processing the data

#sets working directory 
setwd("E:/Directory.R/getdataprojects/UCI HAR Dataset")

#Imports and Reads in the data
xTest = read.table('./test/x_test.txt',header=FALSE); 
yTest = read.table('./test/y_test.txt',header=FALSE); 
yTrain = read.table('./train/y_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
activityType = read.table('./activity_labels.txt',header=FALSE)
subjectTest = read.table('./test/subject_test.txt',header=FALSE); 

#Data Cleaning
#giving column names to the data

colnames(activityType) = c('activityId','activityType');
colnames(subjectTrain) = "subjectId";
colnames(xTrain) = features[,2]; 
colnames(subjectTest) = "subjectId";
colnames(xTest) = features[,2]; 
colnames(yTest) = "activityId";
colnames(yTrain) = "activityId";


#Assignment 1: Merging training sets

trainingData = cbind(yTrain,subjectTrain,xTrain)

#merging the all Test data set
testData = cbind(yTest,subjectTest,xTest);

#combining to create final data set

finalData = rbind(trainingData,testData)


#Create a vector for the column names from the finalData set
colNames  = colnames(finalData)

#Assignment 2: Extracts only the measurements on the mean and standard deviation for each measurement

Measurment = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

#final data based on mesurment 
finalData = finalData[Measurment==TRUE];

#Asignment 3: Use descriptive activity names to name the activities in the data set

#Merging the finalData set with the acitivityType table
finalData = merge(finalData,activityType,by='activityId',all.x=TRUE);

#Updating the colNames
colNames  = colnames(finalData); 


#Assignment5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.

#Create a new table, finalDataNoActivityType without the activityType column

finalDataNoActivityType  = finalData[,names(finalData) != 'activityType'];

# Summarizing the finalDataNoActivityType table 
tidyData    = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean);

# Merging the tidyData with activityType to include descriptive acitvity names
tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE);

# tidyData set 
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t');
