################################################################################
# OVERVIEW
# This file:
#       1. Merges the training and the test data sets to create one data set.
#       2. Extracts only the measurements on the mean and standard deviation for 
#          each measurement.
#       3. Uses descriptive activity names for the activities in the data set
#       4. Appropriately labels the data set with descriptive variable names.
#       5. Creates a second, independent tidy data set with the average of each 
#          variable for each activity and each subject.
#       6. Writes the dataset created in step 5 into a txt file called 
#          `tidy_data.txt`
#
################################################################################

#Set working directory and load required packages
setwd("../UCI HAR Dataset/")
library(dplyr)

#Read in the test and training data
testdata <- read.table("test/X_test.txt")
trainingdata <- read.table("train/X_train.txt")

#Merge the test and training data into one dataset called wearabledata
wearabledata <- rbind(testdata, trainingdata)

#Read in the list of column names
featurelist <- read.table("features.txt")

#Filter the data to only contain the columns that measure the mean and standard
#deviation for all the measurements
columnstoselect <- grepl("mean()",featurelist$V2, fixed = TRUE) | 
        grepl("std()",featurelist$V2, fixed = TRUE)
wearabledatasubset <- wearabledata[,columnstoselect]

#Read in the test and training label data and merge them into one dataset                            
testlabels <- read.table("test/y_test.txt")
traininglabels <- read.table("train/y_train.txt")

wearabledatalabels <- rbind(testlabels, traininglabels)
colnames(wearabledatalabels) <- c("activitylabel")

#Read in the test and training subjects data and merge them into one dataset
testsubjects <- read.table("test/subject_test.txt")
trainingsubjects <- read.table("train/subject_train.txt")

wearablesubjectsdata <- rbind(testsubjects, trainingsubjects)
colnames(wearablesubjectsdata) <- c("subjectnumber")

#Adding the labels and subject data to the wearabledatasubset
wearabledatasubset <- cbind(wearabledatalabels, wearablesubjectsdata, 
                            wearabledatasubset)

#Read in the Activity labels
activitylabels <- read.table("activity_labels.txt")
colnames(activitylabels) <- c("activitylabel","activityname")

#Merge the activitylabels table with wearabledatasubset to get activity names
wearabledatasubset <- merge(activitylabels, wearabledatasubset,
                            by.x = "activitylabel", by.y = "activitylabel", 
                            all = FALSE)

wearabledatasubset <- wearabledatasubset %>% select(-activitylabel)

#Assign corresponding column names to all the columns in wearabledatasubset
columnnames <- featurelist[columnstoselect,]
columnnames <- gsub("\\()","", gsub("-","",columnnames$V2))
columnnames <- c("activityname","subjectnumber",as.character(columnnames))

colnames(wearabledatasubset) <- columnnames

#Get dataset with average of each variable for each activity and each subject
wearabledataaverages <- wearabledatasubset %>% 
        group_by(activityname, subjectnumber) %>% 
        summarise_all(mean)

#Write the tidied data into a csv file
write.table(wearabledataaverages, "tidy_data.txt", row.name=FALSE)