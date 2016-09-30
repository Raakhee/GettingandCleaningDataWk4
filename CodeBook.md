## CodeBook.md
### Getting and Cleaning data week 4 submission

Needs files activity_labels.txt, features.txt, run_Analysis.R in working directory.
The inertia data files were not used in any manner since the assignment did not specify any inertia data.

* -- "test" directory contains test data from test participants - subject_test.txt,X_test.txt,y_test.txt
* -- "train" directory contains train data from train participants - subject_train.txt, X_train.txt and y_train.txt
### File descriptions
* activity_labels -- contains activity corresponding to activity codes
* features.txt -- 561 measurements to be recorded
* subject_test.txt -- the test subjects' identifiers
* X_test.txt -- test data
* y_test.txt -- activity identifiers
* subject_train.txt -- the train subjects' identifiers
* X_train.txt -- train data
* y_train.txt -- activity identifiers

None of the files were transformed in any way. They were downloaded and read using read.table function.
