library(plyr)


## Download data

if(!file.exists("./data")) {
  dir.create("./data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/data.zip")

## Unzip the data file and delete the original zip file
unzip(zipfile="./data/data.zip",exdir="./data")
file.remove("./data/data.zip")

## Read features and activity ids
features <- read.table('./data/UCI HAR Dataset/features.txt')
activities <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Read training and test dataset
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

names(X_train) <- features[,2]
colnames(y_train) <- "activitylabel"
colnames(subject_train) <- "subjectid"


X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

names(X_test) <- features[,2]
colnames(y_test) <- "activitylabel"
colnames(subject_test) <- "subjectid"


## 1.Merges the training and the test sets to create one data set
traindata <- cbind(subject_train, y_train, X_train)
testdata <- cbind(subject_test, y_test, X_test)
data <- rbind(traindata, testdata)


## 2.Extracts only the measurements on the mean and standard deviation for each measurement
featureswanted <- grepl("mean|std", features[,2])
datawanted <- data[,c(TRUE, TRUE, featureswanted==TRUE)]


## 3.Uses descriptive activity names to name the activities in the data set
names(activities) <- c("activitylabel", "activitydes")
datawanted <- merge(datawanted, activities) #Both data frames have a column with name "activitylabel".


## 4.Appropriately labels the data set with descriptive variable names
## This has been completed in the previous steps.


## 5.From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.
library(reshape2)
IDs <- c("subjectid", "activitylabel", "activitydes")
vars <- setdiff(names(datawanted), IDs)
datawantedmelt <- melt(datawanted, id=IDs, measure.vars=vars)
data2 <- dcast(datawantedmelt, subjectid+activitylabel+activitydes ~ variable, mean)

write.table(data2, file="tidy_data.txt", row.name=FALSE)





