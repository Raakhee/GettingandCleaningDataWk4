## run_Analysis.R

library(plyr)
library(dplyr)

# read test set results
testdata <- read.table("test/X_test.txt",fill=TRUE, row.names=NULL,stringsAsFactors=FALSE,header=FALSE)
# read test set subject codes
testsubjdata <- read.table("test/subject_test.txt",fill=TRUE,header=FALSE)
# read test set activity codes
testactvdata <- read.table("test/Y_test.txt",sep="\t",fill=TRUE,header=FALSE)

# read train set results
traindata <- read.table("train/X_train.txt",fill=TRUE,header=FALSE)
# read train set subject codes
trainsubjdata <- read.table("train/subject_train.txt",fill=TRUE,header=FALSE)
# read train set activity codes
trainactvdata <- read.table("train/Y_train.txt",sep="\t",fill=TRUE,header=FALSE)

# read result features codes
featuresdata <- read.table("features.txt",stringsAsFactors=FALSE)

# read activity labels
activitylabels <- read.table("activity_labels.txt",stringsAsFactors=FALSE)

# add Subject and Activity columns to testdata 
testdata$Subject <- testsubjdata$V1
testdata$Activity <- testactvdata$V1
# add Subject and Activity columns to train data
traindata$Activity <- trainactvdata$V1
traindata$Subject <- trainsubjdata$V1
 
# Combine testdata and traindata 
totaldata <- rbind(testdata, traindata)

# rename the columns in activitylabels table
#activitylabels <- rename(activitylabels,c("V1"="Activity","V2"="ActivityLabel"))
names(activitylabels)[names(activitylabels)=="V1"] = "Activity"
names(activitylabels)[names(activitylabels)=="V2"] = "ActivityLabel"
# merge totaldata with activitylabels to get ActivityLabel column into totaldata1
#totaldata1 <- merge(totaldata,activitylabels,by.x="Activity",by.y="Activity",all.x=TRUE)
totaldata1 <- inner_join(totaldata,activitylabels)

# rename columns in totaldata1 using the featuresdata table and store result in totaldata2
totaldata2 <- totaldata1
for (i in 1:nrow(featuresdata)) {
	colnamold <- paste0("V",i)
	#print(colnamold)
	names(totaldata2)[names(totaldata2)==colnamold] <- featuresdata[i,2]
} 

totaldata3 <- NULL
## select mean and std columns and store results in totaldata3
totaldata3 <- totaldata2[,grep("mean|std",names(totaldata2))]
numOfMeasurements <- ncol(totaldata3)
totaldata3$Subject <-  totaldata2$Subject
totaldata3$Activity <- totaldata2$ActivityLabel
 
# obtain mean for measurement data grouped by Activity and Subject
tidydata <- aggregate(totaldata3[1:numOfMeasurements],list(totaldata3$Activity,totaldata3$Subject),mean)
#tidydata <- rename(tidydata,c("Group.1"="Activity","Group.2"="Subject"))
names(tidydata)[names(tidydata)=="Group.1"] = "Activity"
names(tidydata)[names(tidydata)=="Group.2"] = "Subject"
# head(tidydata)
# write tidydata dataset to a text file
write.table(tidydata,file="tidydata.txt",append=FALSE, sep=" ",row.name=FALSE)
# tidydata2 <- read.table("tidydata.txt",sep="")
