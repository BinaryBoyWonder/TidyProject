run_analysis <- function () {
  
    ##Loading the data for the Column names and label of the raw data files and libraries used
    library(dplyr)
    featureList<-read.table("features.txt",header=FALSE)
    actNames<-read.table("activity_labels.txt",as.is=TRUE)
    
    ##loading and combining the x feature files for test and training, and adding
    ##colnames from the featureList file
    XTrain<-read.table("train/X_train.txt")
    XTest<-read.table("test/X_test.txt")
    XTrain<-rbind(XTrain,XTest)
    colnames(XTrain)<-featureList[,2]
    rm("XTest","featureList")
    
    ##loading and combining the activity files
    YTrain<-read.table("train/y_train.txt")
    YTest<-read.table("test/y_test.txt")
    YTrain<-rbind(YTrain,YTest)
    colnames(YTrain)<-c("Activity")
    rm("YTest")
    
    
    ##Creating a new variable "Activity.Names" to provide a descriptive label for each
    YNames<-character()
    for(i in YTrain) {
      YNames<-c(YNames,actNames$V2[i])
    }
    YNames<-data.frame("Activity Name"=YNames)
 

    
    
    
    ##loading and combining the test subject names
    SubTrain<-read.table("train/subject_train.txt")
    SubTest<-read.table("test/subject_test.txt")
    SubTrain<-rbind(SubTrain,SubTest)
    colnames(SubTrain)<-c("Test.Subject")
    rm("SubTest")
    
    ##Building the full dataset combining the subject, activity and feature data
    XTrain<-cbind(YNames,XTrain)
    XTrain<-cbind(YTrain,XTrain)
    XTrain<-cbind(SubTrain,XTrain)
    
    ##freeing up memory by releasing unused tables
    rm("SubTrain","YTrain","YNames","actNames")
   
    
    ##Switching to dplyr methods to extract the mean and standard deviation variables.
    XTrain<-tbl_dt(XTrain)
    XTemp<-select(XTrain,Test.Subject,Activity,Activity.Name,contains(c("mean()")),contains(c("std()")))
    XTemp<-group_by(XTemp,Test.Subject,Activity.Name)
    XTrain<-summarise_each(temp2,funs(mean))
    XTrain
  
}


qTest<-function()
{
 
  l<-character()
  for(i in test) {
    l<-c(l,short$V2[[i]])
  }
  l
}