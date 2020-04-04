rm(list=ls())
if (!require("tools")) {
  install.packages("tools")
  library(tools)
}

# set your own path
setwd("/Users/hendersonkuo/Downloads")

( fileName <- list.files(recursive = TRUE) )
# create a bind between file and extension
# eg. put pdf in pdfFile, put png in pngFile etc.
file <- c("pdfFile","pngFile","jpgFile")
fileExt = c("pdf", "png", "jpg")
names(file) <-fileExt
# if there no match for the extension, then will put the file in it.
exceptionFileName <- "others"

classifyFileExt <- function(fileName, file) {
  # get the extension of the file
  ext <- file_ext(fileName)
  
  # create the file
  i <- 1
  while(i<=length(file)){
    dir.create(file[[i]])
    i <- i+1
  }
  dir.create(exceptionFileName)

  log = c()
  i<-1
  # put the file into the specific file
  while(i<=length(fileName)){
    if(ext[i] %in% fileExt){
      file.copy(fileName[i], file[exceptionFileName])
      log <- append(log, paste(file[exceptionFileName], "<-", fileName[i], sep=" "))
    }
    else{
      file.copy(fileName[i], file[[ext[i]]])
      log <- append(log, paste(file[[ext[i]]], "<-", fileName[i], sep=" "))
    }
    i <- i+1
  }
  return (log)
}

# you can check if every files in correct dir
ans <- classifyFileExt(fileName,file)
