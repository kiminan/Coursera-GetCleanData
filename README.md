### 'Getting and Cleaning Data' Course Project

This documents explains the steps in the script "run\_analysis.R"

##### Fetch metadata

``` r
activity_labels <- 
    read.csv("activity_labels.txt", 
             header = FALSE, sep = "", col.names = c("activityid", "activity"))
features <- 
    read.csv("features.txt", 
             header = FALSE, sep = "")[2] ## Ignore first column
```

##### Fetch training data

``` r
subject_train <- read.csv("subject_train.txt", 
                          header = FALSE, col.names = "subjectid")

y_train <- read.csv("y_train.txt", 
                    header = FALSE, col.names = "activityid")

X_train <- read.csv("X_train.txt", 
                    header = FALSE, sep = "")
```

##### Fetch test data

``` r
subject_test <- read.csv("test/subject_test.txt", 
                         header = FALSE, col.names = "subjectid")

y_test <- read.csv("test/y_test.txt", 
                   header = FALSE, col.names = "activityid")

X_test <- read.csv("test/X_test.txt", 
                   header = FALSE, sep = "")
```

##### Merge the training and the test sets to create one data set

``` r
subjects <- rbind(subject_train, subject_test)
activities <- rbind(y_train, y_test)
dataset0 <- rbind(X_train, X_test)
```

##### Use descriptive column names

``` r
names(dataset0) <- features[,1]
```

##### Extract the measurements on the mean and standard deviation for each measurement

Find all columns with names that contain the strings "mean" or "std"

``` r
statsColumns <- grepl("mean|std", names(dataset0), ignore.case = TRUE)
dataset <- dataset0[statsColumns]
```

##### Attach subjects & activities to the dataset

``` r
dataset <- cbind(activities, subjects, dataset)
```

##### Use descriptive activity names to name the activities in the data set

Merge() will change the order of the data, therefore this step must be performed after activities have been merged with data.

``` r
dataset <- merge(dataset, activity_labels)
```

##### Remove column 'activityid', move column 'activity' to the front

``` r
dataset$activityid <- dataset$activity
dataset$activity <- NULL
names(dataset)[1] <- "activity"
```

##### Appropriately label the data set with descriptive variable names

##### Create a second, independent tidy data set with the average of each variable for each activity and each subject.

``` r
dataset2 <- dataset %>% 
  group_by(subjectid, activity) %>%
  summarise_all(funs(mean))

#Persist the new dataset
write.table(dataset2,"dataset2.txt", row.names = FALSE )
```
