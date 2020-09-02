# Getting And Cleanining Data Assignment

One of the most exciting areas in all of data science right now is wearable 
computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and 
Jawbone Up are racing to develop the most advanced algorithms to attract new 
users. 

As part of this assignment, data collected from the 
accelerometers from the Samsung Galaxy S smartphone was used. A full description is 
available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The repository contains the following files:

- `README.md`, this file, has a summary of the data and how it was created
- `tidy_data.txt`, the tidy data set.
- `CodeBook.md`, the code book, which describes the variables of the data set 
- `run_analysis.R`, the script used to get from the raw data to the tidy data

### run_analysis.R
This script can be used to create the tidy dataset that is present in `tidy_data.txt`.
This script,

1. Merges the training and the test data sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Writes the dataset created in step 5 into a txt file called `tidy_data.txt`



