library(dplyr)
library(tidyr)

getUsableData <- function () {
  # Load the raw dataset, filter only the timeframe we're interested in, 
  # and add a computed timedate object
  #
  # Args:
  #   nothing
  #
  # Returns:
  #   a data.frame with 10 variables:
  #  data.frame with  2880 obs. of  10 variables:
  # Date                 : chr  
  # Time                 : chr  
  # Global_active_power  : num  
  # Global_reactive_power: num  
  # Voltage              : num  
  # Global_intensity     : num  
  # Sub_metering_1       : num  
  # Sub_metering_2       : num  
  # Sub_metering_3       : num  
  # DateTime             : POSIXlt 
  
  # Unzp the zip file, because the unzipped texte file is to huge for Github
  unzip("data/exdata-data-household_power_consumption.zip", exdir="data")
  
  tColNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  tColClasses <- c("character", "character", "double", "double", "double", "double", "double", "double", "double")
  dat <- read.table("data/household_power_consumption.txt", header = TRUE, skip = 66636, nrows = 2880,sep = ";", na.strings = c("?", "", "NA"), colClasses = tColClasses)
  colnames(dat) <- tColNames
  
  # Convert the dates
  dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M")
  
  dat
}
