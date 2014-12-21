GettingCleaningData
===================

Project work for Coursera course, Getting and Cleaning Data
-------------------

### Project Description:

he purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

### Description of the run_analysis.R Script:

The working directory must be set prior to sourcing the script to the directory that contains the UCI HAR Dataset directory

From there, the script performs the following actions:

1. Read in the activity labels text file and assign column names
2. Read in the features text file and assign column names
3. Read in the three test text files, assign column names, combine to one file, and add a column with "test"
4.Read in the three train text files, assign column names, combine to one file, and add a column with "train"
5. Combine the test and train datasets into one called full_data
6. Subset the full data into just mean and std columns; store in meanstd_data
7. Merge in the activity_name
8. Load the Reshape 2 package to perform melt and dcast functions for summarization
9. Melt the dataset by subject and activity; remove activity_id and source columns as variables since they are not numeric
10. Cast the data back into columns, but condensed for average by subject and activity; this is the tidy dataset requested by the project
11. Output to new text file, called step_5_tidy_data.txt

Codebook of tidy dataset provided separately