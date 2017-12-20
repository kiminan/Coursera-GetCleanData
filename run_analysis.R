## Fetch metadata
activity_labels <- read.csv("data/assignment/activity_labels.txt", header = FALSE, sep = "", col.names = c("activityid", "activity"))
features <- read.csv("data/assignment/features.txt", header = FALSE, sep = "")[2]
## (Ignore first column)

## Fetch training data
subject_train <- read.csv("data/assignment/train/subject_train.txt", header = FALSE, col.names = "subjectid")
y_train <- read.csv("data/assignment/train/y_train.txt", header = FALSE, col.names = "activityid")
X_train <- read.csv("data/assignment/train/X_train.txt", header = FALSE, sep = "")

## Fetch test data
subject_test <- read.csv("data/assignment/test/subject_test.txt", header = FALSE, col.names = "subjectid")
y_test <- read.csv("data/assignment/test/y_test.txt", header = FALSE, col.names = "activityid")
X_test <- read.csv("data/assignment/test/X_test.txt", header = FALSE, sep = "")

## Merge the training and the test sets to create one data set
subjects <- rbind(subject_train, subject_test)
activities <- rbind(y_train, y_test)
dataset0 <- rbind(X_train, X_test)

## Use descriptive column names
names(dataset0) <- features[,1]

## Extract columns which include stats info
statsColumns <- grepl("mean|std", names(dataset0), ignore.case = TRUE)
dataset <- dataset0[statsColumns]

## Attach subjects & activities to data
dataset <- cbind(activities, subjects, dataset)
## Merge() will reorder, therefore this must be done after activities are merged with data
dataset <- merge(dataset, activity_labels)

## Remove column activityid, move column activity to front
dataset$activityid <- dataset$activity
dataset$activity <- NULL
names(dataset)[1] <- "activity"

library(dplyr)

#Have a look at the data
dataset %>% 
  group_by(subjectid, activity)  %>% 
  tally()

#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
dataset2 <- dataset %>% 
  group_by(subjectid, activity) %>%
  summarise_all(funs(mean))

"Persist the new dataset"
write.csv(dataset2,"data/assignment/dataset2.csv", row.names = FALSE )
