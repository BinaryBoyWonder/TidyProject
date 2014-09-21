pollutantmean1 <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  d<-directory
  
  ##fileList<-seq(id)
  print(id)
  pass<-0
  fileList<-c()
  for(i in id) {
      pass<-pass+1
      if(i<10) {
        ##print(paste("00",i,".csv",sep=""))
        fileList<-c(fileList,paste("00",i,".csv",sep=""))
      } else if(i<100){
        fileList<-c(fileList,paste("0",i,".csv",sep=""))
      }
      else{
        fileList<-c(fileList,paste(i,".csv",sep=""))
      }
    
  }
  print(fileList)
}

