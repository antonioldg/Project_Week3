## run_analysis.R
## Getting and Cleaning Data - Course Project
## References: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## References: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

    ## 1. Merges the training and the test sets to create one data set.
    ## Note: As Triaxial acceleration and Triaxial Angular velocity is not required in the next steps of the project,
    ##they will not be included in the set. Otherwise the files in the "Inertial Signals" should be taken into account.
    ##Read the files into a list of tables
    ##Note Important: All files need to be copied to the working directory
    library(plyr)
    ## Read test files
      x_test <- read.table("X_test.txt")
      y_test <- read.table("y_test.txt")
      subject_test <- read.table("subject_test.txt")
    ## Read train files
      x_train  <- read.table("X_train.txt")
      y_train  <- read.table("y_train.txt")
      subject_train <- read.table("subject_train.txt")
    ## Create merged data frames for train and test data.
      test_data  <- cbind(Person=subject_test,Activity=y_test,x_test)
      train_data  <- cbind(Person=subject_train,Activity=y_train,x_train)
    ## Merge training and test sets to data_merged
      data_merged  <- rbind(test_data,train_data)

    
    ## 2 Extract only the measurements on the mean and standard deviation for each measurement.
    ## Information on which columns to take comes from features.txt is set in mean_std vector.
      mean_std  <- c(which(grepl('mean',features$V2),arr.ind=TRUE),which(grepl('std',features$V2),arr.ind=TRUE),which(grepl('Mean',features$V2),arr.ind=TRUE))
    ## create vectors of only the mean and std for test and train
      x_test_mean_std  <- x_test[,mean_std]
      x_train_mean_std  <- x_train[,mean_std]
    ## create the merged data vector again as above
    ## Although not really necessary for this assigment, I added one variable "File", to be able to distinguish between Test and
    ## train data. It is mentioned as best practice in Week1 paper http://vita.had.co.nz/papers/tidy-data.pdf
      test_data_mean_std  <- cbind(File="Test Data File",Person=subject_test,Activity=y_test,x_test_mean_std)
      train_data_mean_std  <- cbind(File="Train Data File",Person=subject_train,Activity=y_train,x_train_mean_std)
    ## data_merged_mean_std is the result for question 2
      data_merged_mean_std  <- rbind(test_data_mean_std,train_data_mean_std)

    
    ## 3. Uses descriptive activity names to name the activities in the data set
    ## the file "activity_labels.txt" contains the description of the activities
    ## the 3rd column (activity) is set as a factor and the labels are taken from the "activity_labels.txt" 
      activity_labels  <- read.table("activity_labels.txt")
      data_merged_mean_std[,3]  <- as.factor(data_merged_mean_std[,3])
      levels(data_merged_mean_std[,3]) <- activity_labels$V2

    
    ## 4. Appropriately labels the data set with descriptive variable names
    ##colnames(data_merged_mean_std) <- c("File","Person ID","Activity",)
      mean_std  <- sort.int(mean_std,decreasing=FALSE) 
      x_column_names  <- as.character(features[mean_std,2])
      colnames(data_merged_mean_std) <- c("File","Person_ID","Activity",x_column_names)
    ## TIDY DATA 1 result is dataframe tidy_data1
      tidy_data1 <- data_merged_mean_std

    
    ## 5. Creates a second, independent tidy data set with the average of each variable for
    ## each activity and each subject
      library(reshape2)
    ## Use of reshape2 library with melt and dcast as shown in Week3 lesson 
      data_melt  <- melt(tidy_data1,id=c("Person_ID","Activity"),measure.vars=x_column_names)
    ## TIDY DATA 2 result is dataframe tidy_data2  
      tidy_data2  <- dcast(data_melt, Person_ID+Activity ~ variable,mean)
