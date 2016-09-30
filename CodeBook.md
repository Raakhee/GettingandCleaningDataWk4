## CodeBook.md
### Getting and Cleaning data week 4 submission

### Needs files activity_labels.txt, features.txt, run_Analysis.R in working directory.
### Needs files subject_test.txt,X_test.txt,y_test.txt in directory "test" within working directory
### Needs files subject_train.txt, X_train.txt and y_train.txt in directory "train" within working directory.

### "test" directory contains test data from test participants 
### "train" directory contains train data from train participants
### File descriptions
 activity_labels -- contains activity corresponding to activity codes
features.txt -- 561 measurements to be recorded
subject_test.txt -- the test subject identifiers
X_test.txt -- test data
y_test.txt -- activity identifiers
subject_train.txt -- the train subject identifiers
X_train.txt -- train data
y_train.txt -- activity identifiers

None of the files were transformed in any way. They were downloaded and read using read.table function.
