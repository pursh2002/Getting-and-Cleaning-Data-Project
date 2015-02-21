Description

The script run_analysis.R performs the following  steps towards course project
1. Sets working directory (The file was directly downloaded into my computer and stored in a directory.R file)
2. Latter Imports and Reading the data activity was performed 
3. Data cleaning activity was performed and coloum names were given to the dta 
4. merging and combining all  training and test data sets were done as per question 1
5. Vectors for vector for the column names  were assigned 
6. Extracts only the measurements on the mean and standard deviation for each measurement as per question wee done 
7. descriptive activity names to name the activities in the data set by Merging the Data set with the acitivity file
8. colomnames were updated 
8. independent tidy data set with the average of each variable for each activity and each subject waas done by summarizing theough aggregate function.
9. tidy data with write.table() using row.name=FALSE

Variables

1.features.txt
2. activity_labels.txt
3.subject_train.txt
4.x_train.txt
5.y_train.txt
6. subject_test.txt
7. x_test.txt
8. y_test.txt
contain the data from the downloaded files on whic data are read and analysed throught he steps mentioned above.

The exercise were performed with help from 
https://github.com/hglennrock/getting-cleaning-data-project
https://github.com/OscarPDR/Coursera-Getting-and-Cleaning-Data-Course-Project
https://bitbucket.org/maurotrb/getting-cleaning-data-2014-project/src
https://rstudio-pubs-static.s3.amazonaws.com/30578_9519a6fce3524cc5a21dfba8c9ef6e69.html
