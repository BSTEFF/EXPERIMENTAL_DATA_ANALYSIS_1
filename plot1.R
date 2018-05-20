
library(reshape2)
library (dplyr)

#Dataset size estimate in gb (2,075,259 rows * 9 columns * ~10 bytes per value)
print(2075259*9*10/8388608)	

#read dataset
HPC = read.csv(file ="household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
HPC$Date = as.Date(HPC$Date, format = "%d/%m/%Y")

# Subset the dataset
HPC_sub = subset(HPC, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
HPC_sub$Datetime = as.POSIXct(paste(HPC_sub$Date,HPC_sub$Time),format="%Y-%m-%d %H:%M:%S")

#readable for plotting
HPC_sub$Global_active_power = as.numeric(HPC_sub$Global_active_power)

######
#plot 1
par(mfrow=c(1,1))
hist(HPC_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power [Kilowatts]", ylim = NULL)

#safe plot 1
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()







