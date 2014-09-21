This file contain details on the script file run_analysis.R

To run this file, you must first download and unpack the data file
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This file will function correctly from the UCI HAR Dataset directory set as your working directory. There is no need to move the data from the test and train subdirectory.


Additionally, you will need to have installed the dplyr library to utilize some of the functions in this script.

The script works as follow:

1) Initial loading of needed libraries and the data label files.
2) Loading and combining the test and training data for each of the following:
    a) Feature data (X_test.txt and X_train.txt)
    b) Activity data (y_test.txt and y_train.txt)
    c) test subjects data (subject_test.txt and subject_train.txt)
    
3) Renaming of the column names is done by extracting the values from the corresponding label text file, with the exepction of Test.Subjects, Activity, and Activity.Name, which are written in the function.

4) Activity.Name varible is created by extracting the label name from activity_labels.txt

5) Reducing the variable to include only those dealing with mean or standard deviation is done using the select() function

6) Group_by and summarise_each are used to extract the file tidyset.

Note: This function will not directly create a data file. write.table() can be used if an actual saved file it desired.
    
