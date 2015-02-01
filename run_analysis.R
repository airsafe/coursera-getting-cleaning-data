# Objective is Merge training and test sets, add appropriate headings, and eliminate data columns
#  that that do not involve the measurement of a mean or standard deviation.

# Two tidy data sets will be created, one with all of the observations, but
#  limited to columns involving measurements of the mean or standard deviation,
#  and the second which has the means for each data column for each unique
#  combination of Subject and Activity

# Working directory "/Users/airsafe/gitdev/GettingCleaningData/project"

# Read and merge training and test data
# Test data in X_train.txt and X_test.txt
data_train <- as.data.frame(read.table("X_train.txt"))
data_test <- as.data.frame(read.table("X_test.txt"))
data_all <- as.data.frame(rbind(data_train,data_test)) # All data (10,299 rows by 561 columns), default headings

# Read in the column of subject IDs
subjects_train <- as.data.frame(read.table("subject_train.txt")) # Data frame with 7352 rows, 1 column
subjects_test <- as.data.frame(read.table("subject_test.txt")) # Data frame with 2947 rows, 1 column
subjects_all <- rbind(subjects_train,subjects_test)

# Checked to see if all first 7352 elements Subject_ID equal to all elements of subject_train
#  - all(Subject_ID[1:7352,1]==subject_train) and all(Subject_ID[7353:10299,1]==subject_test)

# Also did hist(Subject_ID[,1]) [visual] and table(Subject_ID[,1]) [counts] 
#  to see if the combined subject data is consistent with the raw subject data

# Read in the column of activity codes
activity_codes_train <- as.data.frame(read.table("y_train.txt")) # Activity codes (six variations) in data frame with 7352 rows, 2 column
activity_codes_test <- as.data.frame(read.table("y_test.txt")) # Activity codes (six variations) in data frame with 2947 rows, 2 column
activity_codes_all <- rbind(activity_codes_train,activity_codes_test)

# Checked to see if all first 7352 elements Activity_ID equal to all elements of activity_train
#  - all(activity_codes_all[1:7352,1]==activity_codes_train) and all(activity_codes_all[7353:10299,1]==activity_codes_test)

# Also did hist(activity_codes_all[,1]) [visual] and table(activity_codes_all[,1]) [counts] 
#  to see if the combined subject data is consistent with the raw subject data

# Want to create a data frame with the names assoicaed with each value in the Activity_ID column

activity_names <- as.data.frame(read.table("activity_labels.txt"))
activity_names[,2] <- as.character(activity_names[,2])
 # Data frame with 6 rows, names in column 2
# nrow(Activity_ID)

# Will now have a vector with the activity name associated with the Activity_ID
Activity<- NULL
for (i in 1:nrow(activity_codes_all)) { # print(i) test only
  for(j in 1:nrow(activity_names)){
    if(activity_codes_all[i,1]==activity_names[j,1]){
      Activity <- rbind(Activity, activity_names[j,2])
      # print(activity_names[j,2]) test only
    }
  }
}

# Now will use cbind() to combine the following columns in order:
#  Subject_ID, Activity, Activity_ID; data_all (which has the 561 raw data columns)
bigtable <- NULL
bigtable <- cbind(subjects_all, Activity, activity_codes_all, data_all)

# Now will create a vector of the 561 raw data column names
var_names <- as.data.frame(read.table("features.txt")) 

# var_names is a two column data frame, index in first column and variable name in the second 
# Must ensure the data column names are of type character
var_names[,2] <- as.character(var_names[,2])

# Now will apply the column names for all 

bigtable_column_names <- c("Subject","Activity","Activity_ID",var_names[,2])
# Update the column names to full character names for each column
colnames(bigtable) <- bigtable_column_names

# Will now copy bigtable into a sandbox in case further operations on 
#  bigtable during testing corrupts the loaded data

# sandbox <- bigtable testing_only

# Let's see which data columns have 'mean' or 'std' in the column name

# From reviewing features_info.txt, and the variable names in featrures.txt in TextWranger, 
#   the variables descriging a mean of a signal has the character string 'mean' within the
#   approriate data column name, and the string 'std' for a column with standard deviations
#   Used the R function 'grep' on vector 'bigtable_column_names
#   to find columns without either 'mean' or 'std' and to create data table with only
#   mean and standard deviation values.

# Looking at features.txt in TextWranger, should be 33 columns with 'std', and 53 with mean.
#   The string

# From results from running 'grep' twice for "std" and "mean", no variable
#   name has both "std" and "mean", though three included "mean" twice

keep_data_columns <- grep("mean|std",bigtable_column_names, ignore.case = TRUE)

# Now to create a revised data frame (bigtable_revised), which is a tidy data frame with only mean and standard deviaiton data columns

bigtable_revised <- cbind(bigtable[,c(1:3,keep_data_columns)])

# Next objective is to create  a second tidy data frame where each row (observiation)
#  has the means of each of the data columns for each combination of Subject and Activty.

# First step is to identify and sort the unique comabinations of Subject (column 1)
#   and Activity (using Activity_ID in column 3)

subjects_unique <- sort(unique(bigtable_revised[,1]))
activity_unique <- sort(unique(bigtable_revised[,3]))

# Below, the loop will extract every combination of Subject and Activty_ID, perform a mean of all the data columns, 
#  and rbind it to build a tidy database of the means of the mean and standard deviations

# token <- 0 test_only
tidy_means <- NULL
for (i in 1:length(subjects_unique)){
  for (j in 1:length(activity_unique)){
    means_subset <- bigtable_revised[bigtable_revised$Subject==subjects_unique[i]&bigtable_revised$Activity_ID==activity_unique[j],]
    nrow(means_subset)
    means_vector<-(sapply(means_subset[,4:ncol(bigtable_revised)],mean))
    new_row[1:3] <-c(subjects_unique[i],activity_names[activity_unique[j],2],activity_unique[j])
    new_row[4:ncol(bigtable_revised)]<-means_vector
    tidy_means <- rbind(tidy_means,new_row)
    # token <- token + 1 test_only
  }
}

# Ensure all numeric columns are of type numeric, and have eighe digits
#   to the right of the decimal point, just like the input data

for (k in 1:ncol(tidy_means)){
  if(k!=2){tidy_means[,k] <- round(as.numeric(tidy_means[,k]), digits=8) }
}

# Export the data frame tidy_means to the working directory to a 
#   tab-delimited text file in the working directory

write.table(tidy_means, file="tidy_means.txt", row.names = FALSE , sep=" ")

# This completes this project. Two tidy data sets have been created:
#  1. bigtable_revised which has all the data columns involving a mean 
#     or stndard deviation
#  2. tidy_means which has the means of all the data columns of 
#     bigtable_revised with each row representing a unique combination 
#     of a subject and activity.
