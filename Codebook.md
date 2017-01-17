Variables
X_train, y_train, subject_train, X_test, y_test, subject_test, features, activities extract data from source dataset.
traindata, testdata merge data from train and test dataset. data merges traindata and testdata for further analysis.
featureswanted contains the feature that are on the mean and standard deviation and datawanted contains only the measurements with featureswanted.
data2 summarizes datawanted with mean of each measurement for each activity and each subject.

Data
The source data of the project can be downloaded at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Transformations
The following steps have been done by running run_analysis.R
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

