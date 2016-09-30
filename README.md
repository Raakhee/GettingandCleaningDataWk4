# GettingandCleaningDataWk4
Getting and Cleaning Data Week4 project
This text explains the runAnalysis.R code.

This script reads all the test, train data files as well as the key files that list the measurements and activities.

1.As a first step, the script adds the Subject and Activity data to the measurement data for both test and train sets.

2. It then combines the test and train data based on Subject and Activity codes as keys. Since the subjects of the test and train sets do not overlap, there is no risk of duplicate data.

3. Script then reads the master files to add activity descriptions, as well as column names for the measurements.

4. Script calculates mean and SD for each measurement column and stores it in meanCol and sdCol respectively.

5. Script then measures the mean of the measurements grouped by Activity and Subject and writes it to a dataset called tidydata. This contains mean for every Activity-Subject combination so we get 180 (6 X 30) rows, each containing means of the 561 measurements.

The tidydata is written to a text file. 
