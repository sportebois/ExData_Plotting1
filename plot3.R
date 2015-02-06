
# Will generate plot3.png : Energy sub metering ~ time

# Disable the automatic locale detection to make sure we get english day names rather than "Jeudi, Vendredi ,..."
Sys.setlocale( category = "LC_ALL", locale =  "C")

# Import the code to load the data
source("dataProvider.R")
dat <- getUsableData()


# Output to png
# Regular PNG
# png(filename = "plot3.png", width = 504, height = 504, units = "px")
# But we'll use Cairo to get anti-alias PNG even on Windows
library(Cairo)
CairoPNG("plot3.png",  width = 504, height = 504)

lbl.title <- ""
lbl.x <- ""
lbl.y <- "Energy sub metering"
# Prepare the plot with the maximumvalue to get the correct axis
ymax <- max(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3)
plot(dat$DateTime, dat$Sub_metering_1, type="n", ylim=c(0, ymax)  ,main = lbl.title, xlab = lbl.x, ylab = lbl.y)

# Plot each metric with a different color
points(dat$DateTime, dat$Sub_metering_1, type="l", col="black")
points(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
points(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")

# Add legend
legend("topright", pch="_", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() # Clean the device