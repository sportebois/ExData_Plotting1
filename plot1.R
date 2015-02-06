
# Will generate plot1.png : Global Active Power (histogram)

# Import the code to load the data
source("dataProvider.R")
dat <- getUsableData()

# Output to png

# Regular PNG
# png(filename = "plot1.png",  width = 504, height = 504, units = "px")
# But we'll use Cairo to get anti-alias PNG even on Windows
library(Cairo)
CairoPNG("plot1.png",  width = 504, height = 504)

lbl.title <- "Global Active Power"
lbl.x <- "Global Active Power (kilowatts)"
hist(dat$Global_active_power, main = lbl.title, xlab = lbl.x, col="red")

dev.off() # Clean the device