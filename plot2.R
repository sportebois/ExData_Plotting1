
# Will generate plot2.png : Global Active Power ~ time

# Disable the automatic locale detection to make sure we get english day names rather than "Jeudi, Vendredi ,..."
Sys.setlocale( category = "LC_ALL", locale =  "C")

# Import the code to load the data
source("dataProvider.R")
dat <- getUsableData()



# Output to png
library(Cairo)
# Regular PNG
png(filename = "plot2.png", width = 480, height = 480, units = "px", type="cairo", bg=NA)
# But we'll use Cairo to get anti-alias PNG even on Windows
#CairoPNG("plot2.png",  width = 480, height = 480, bg=NA)

lbl.title <- ""
lbl.x <- ""
lbl.y <- "Global Active Power (kilowatts)"
with(dat, plot(DateTime, Global_active_power, type="l", main = lbl.title, xlab = lbl.x, ylab = lbl.y))

dev.off() # Clean the device
