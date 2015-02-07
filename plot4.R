
# Will generate plot4.png : 4 plots - Global active power, Voltage, Energy Sub metering, Global_reactivepower

# Disable the automatic locale detection to make sure we get english day names rather than "Jeudi, Vendredi ,..."
Sys.setlocale( category = "LC_ALL", locale =  "C")

# Import the code to load the data
source("dataProvider.R")
dat <- getUsableData()


# Prepare the canvas to display 4 graphs

# Output to png
library(Cairo)
# Regular PNG
png(filename = "plot4.png", width = 480, height = 480, units = "px", type="cairo", bg=NA)
# But we'll use Cairo to get anti-alias PNG even on Windows
#CairoPNG("plot4.png",  width = 480, height = 480, bg=NA)

par(mfcol = c(2,2), cex = 0.75) # 2 by 2 matrix, first two will be top left, bottom left


# Graph1: Global active power in time -------------------------------------
lbl.title <- ""
lbl.x <- ""
lbl.y <- "Global Active Power"
with(dat, plot(DateTime, Global_active_power, type="l", main = lbl.title, xlab = lbl.x, ylab = lbl.y))


# Graph 2: Energy sub metering --------------------------------------------
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
legend("topright", pch="_", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")


# Graph 3: Voltage --------------------------------------------------------
lbl.title <- ""
lbl.x <- "datetime"
lbl.y <- "Voltage"
plot(dat$DateTime, dat$Voltage, type="l", main = lbl.title, xlab = lbl.x, ylab = lbl.y)



# Graph 4: Global reactive power  -----------------------------------------
lbl.title <- ""
lbl.x <- "datetime"
lbl.y <- "Global_reactive_power"
plot(dat$DateTime, dat$Global_reactive_power, type="l", main = lbl.title, xlab = lbl.x, ylab = lbl.y)


dev.off() # Close the png recording
