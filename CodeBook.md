# Code Book

## Getting and Cleaning Data Course Project
The purpose of this project is to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

## Study design
As part of this project, data collected from the 
accelerometers from the Samsung Galaxy S smartphone was used. A full description is 
available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The README.txt that is associated with the raw data file describes the data is given below:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Processing the raw data
The file `run_analysis.R` was used to clean the raw dataset and get to the tidy 
dataset that is described in this code book.

### Steps to get from the raw data to the tidy data 

1. Download the raw data from the link below
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the data file and set the unzipped folder as your working directory in the first line of the `run_analysis.R` file.
3. Run all the code in `run_analysis.R`
4. The tidy_data.txt file will be written into your working directory

### Cleaning the data
The following processes are performed on the raw data to get the tidy data

1. Read in the test data from `X_test.txt` and training data from `X_train.txt` 
   and merge them.
2. Filter the dataset to only include columns that measure the mean and standard
   deviation for all the measurements, by reading in the column names from `features.txt`
   and filtering for columns containing "mean()" or "std()"
3. Read in the activity labels from `y_test.txt` and `y_train.txt` and merge them.
4. Read in the subject data from `subject_test.txt` and `subject_train.txt` and merge them.
5. Merge the activity labels and subject data with the data set from step 2.
6. Replace the activity lables which are recorded as integers between 1 and 6 
   with the activity description.
7. Assign the correct variable names to all the columns in the data set.
8. From the data set in step 8, creates a second, independent tidy data set with 
   the average of each variable for each activity and each subject.
   
## Description of Variables 

- **subject**

	Subject identifier, integer, ranges from 1 to 30.

- **activity**

	Activity identifier, string with 6 possible values: 
	- `WALKING`
	- `WALKING_UPSTAIRS`
	- `WALKING_DOWNSTAIRS`
	- `SITTING`
	- `STANDING`
	- `LAYING`

#### Average of measurements

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAccmeanX            
- tBodyAccmeanY           
- tBodyAccmeanZ            
- tBodyAccstdX             
- tBodyAccstdY             
- tBodyAccstdZ            
- tGravityAccmeanX         
- tGravityAccmeanY         
- tGravityAccmeanZ         
- tGravityAccstdX
- tGravityAccstdY          
- tGravityAccstdZ          
- tBodyAccJerkmeanX        
- tBodyAccJerkmeanY       
- tBodyAccJerkmeanZ        
- tBodyAccJerkstdX         
- tBodyAccJerkstdY         
- tBodyAccJerkstdZ        
- tBodyGyromeanX           
- tBodyGyromeanY           
- tBodyGyromeanZ           
- tBodyGyrostdX           
- tBodyGyrostdY            
- tBodyGyrostdZ            
- tBodyGyroJerkmeanX       
- tBodyGyroJerkmeanY      
- tBodyGyroJerkmeanZ       
- tBodyGyroJerkstdX        
- tBodyGyroJerkstdY
- tBodyGyroJerkstdZ       
- tBodyAccMagmean          
- tBodyAccMagstd           
- tGravityAccMagmean
- tGravityAccMagstd       
- tBodyAccJerkMagmean      
- tBodyAccJerkMagstd       
- tBodyGyroMagmean
- tBodyGyroMagstd         
- tBodyGyroJerkMagmean     
- tBodyGyroJerkMagstd      
- fBodyAccmeanX            
- fBodyAccmeanY           
- fBodyAccmeanZ            
- fBodyAccstdX             
- fBodyAccstdY             
- fBodyAccstdZ           
- fBodyAccJerkmeanX        
- fBodyAccJerkmeanY        
- fBodyAccJerkmeanZ        
- fBodyAccJerkstdX        
- fBodyAccJerkstdY         
- fBodyAccJerkstdZ         
- fBodyGyromeanX           
- fBodyGyromeanY          
- fBodyGyromeanZ           
- fBodyGyrostdX            
- fBodyGyrostdY            
- fBodyGyrostdZ           
- fBodyAccMagmean          
- fBodyAccMagstd           
- fBodyBodyAccJerkMagmean  
- fBodyBodyAccJerkMagstd  
- fBodyBodyGyroMagmean     
- fBodyBodyGyroMagstd      
- fBodyBodyGyroJerkMagmean 
- fBodyBodyGyroJerkMagstd  


