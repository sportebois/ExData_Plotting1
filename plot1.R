
# Will generate plot1.png : Global Active Power (histogram)

# Import the code to load the data
source("dataProvider.R")
dat <- getUsableData()

# Output to png

# Regular PNG
library(Cairo)
png(filename = "plot1.png", width = 480, height = 480, units = "px", type="cairo", bg=NA)
# Alternative:  Cairo to get anti-alias PNG even on Windows
# Cairo("plot1.png",  width = 480, height = 480, type="png", bg=NA)

lbl.title <- "Global Active Power"
lbl.x <- "Global Active Power (kilowatts)"
hist(dat$Global_active_power, main = lbl.title, xlab = lbl.x, col="red")

dev.off() # Clean the device
