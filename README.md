==================================================================
Getting and Cleaning Data Course.
==================================================================
DATA sources
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
==================================================================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The run_analysis.R script does the following:
	1.	Merges the training and the test sets to create one data set.
All files need to be copied to the working directory where run_analysis.R is executed. 
As Triaxial acceleration and Triaxial Angular velocity is not required in the next steps of the project,  they will not be included in the set. Otherwise the files in the "Inertial Signals" should be taken into account.

  2.   Extracts only the measurements on the mean and standard deviation for each measurement. 
Information on which columns to take comes from features.txt . The considered measurements have the following strings:
'mean‘, 'std' and 'Mean' .

  3.  Uses descriptive activity names to name the activities in the data set
The file "activity_labels.txt" contains the description of the activities

  4.  Appropriately labels the data set with descriptive variable names. 
Tidy data is already created in data frame : tidy_data1

  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Reshape2 library is used to summarize the data. The second independent data frame is: tidy_data2

==================================================================
- README.txt
- run_analysis.R
- code_book.md
==================================================================

