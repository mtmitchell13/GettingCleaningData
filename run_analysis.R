## Read in the activity labels text file and assign column names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity_id", "activity_name")

## Read in the features text file and assign column names
features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("feature_id", "feature_name")

## Read in the three test text files, assign column names, combine to one file,
## and add a column with "test"
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- c("subject_id")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
names(X_test) <- as.character(features$feature_name)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test) <- c("activity_id")

test_data <- cbind(subject_test, y_test, X_test)

test_data$Source <- c("test")

## Read in the three train text files, assign column names, combine to one file,
## and add a column with "train"
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- c("subject_id")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(X_train) <- as.character(features$feature_name)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train) <- c("activity_id")

train_data <- cbind(subject_train, y_train, X_train)

train_data$Source <- c("train")

## Combine the test and train datasets into one called full_data
full_data <- rbind(test_data, train_data)

## Subset the full_data into just mean and std columns; store in meanstd_data
meanstd_cols <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203, 204, 216, 217, 
                   229, 230, 242, 243, 255, 256, 268:273, 347:352, 426:431, 
                   505, 506, 518, 519, 531, 532, 544, 545, 564)

meanstd_data <- full_data[, meanstd_cols]

## Merge in the activity_name
mergedData <- merge(meanstd_data, activity_labels, by="activity_id", all.x=TRUE)

## Load the Reshape 2 package to perform melt and dcast functions for summarization
library(reshape2)

## Melt the dataset by subject and activity; remove activity_id and source columns as
## variables since they are not numeric
meltData <- melt(mergedData[, c(2:68,70)], id=c("subject_id","activity_name"))

## Cast the data back into columns, but condensed for average by subject and activity;
## this is the tidy dataset requested by the project; output to new text file
dcastData <- dcast(meltData, subject_id + activity_name ~ variable, mean)

write.table(dcastData, file="step_5_tidy_data.txt", row.names=FALSE)