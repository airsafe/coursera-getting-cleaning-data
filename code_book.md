# DATA DICTIONARY - GETTING AND CLEANING DATA PROJECT

This data dictionary provides a short description of the two tidy data database files that were the output
of the R script, as well as a short description of data and other information contained in the two files.
Both tidy data files have the same column names for their 89 columns, but the data columns have
different descriptions.

## GENERAL NOTES ON DATA

* There are no empty, null, or NA values in any row or column of either tidy database.

* Additional background information on the data is available in the associated README file.

* There are 89 variable names in both databases.

* The first three variables describe the same data in both databases. 

* In the first tidy database (bigtable_revised) each of the remaining 86 variables describe the 
mean or standard deviation of one of the time or frequency data  measured during a 
specific combination of Subject and Activity, and are multiple measurements for each 
combination of Subject and Activity.

* In the second tidy database (tidy_mean) each of the 86 data variable name describe the mean of the
multiple multiple mean or  standard deviation measurements of the multiple time and frequency data 
for a specific combination of Subject and Activity. There is one measurement (in a single database 
row) for each combination of Subject and Activity.
 
 * For both databases, the 86 data variables are numeric, and are normalized to to be between -1 and 1.
 The 53 variable names containing the character string 'mean' it is associated with the mean of a measurement,
 and the 33 variable names the character string 'std' it at associated with the standard deviation
 of a measurement.
 
 * Additional information about all the variables is available in the README file associated with this project.
 
### FIRST THREE VARIABLES

Subject
 * Description: Integer representing identity of the experimental subjects
 * Length: up to two digits
 * Same for both data sets

Activity
 * Description: Character string indicating which of the six activities were performed by experimental subjects
 * Length: Variable
 * Same for both data sets
 
Activity_ID
 * Description: Integer representing identity of the experimental subjects
 * Length :one digits
 * Same for both data sets
 
### REMAINING 86 VARIABLES (see descriptions above)

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()
angle(tBodyAccMean,gravity)
angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)
angle(tBodyGyroJerkMean,gravityMean)
angle(X,gravityMean)
angle(Y,gravityMean)
angle(Z,gravityMean)
