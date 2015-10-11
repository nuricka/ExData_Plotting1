# plot2.R
#==============

# Create a directory, download and extract the data if necessary
if (!dir.exists("./project1")) dir.create("project1");
if (!file.exists("./exdata-data-household_power_consumption.zip")){
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip("./exdata-data-household_power_consumption.zip",list = FALSE, exdir="./project1", overwrite = TRUE); # extraiem el fitxer
}

# Read the data
data<-read.table("./project1/household_power_consumption.txt", sep=";",header=TRUE, na.strings = c("?",""), stringsAsFactors=FALSE,dec=".");

# Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y");
library(dplyr);
data<-filter(data,Date>="2007-02-01" & Date<="2007-02-02");

# Preparing the data in the appropriate format to be ploted
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S");
Sys.setlocale("LC_TIME","English"); 

# Create the plot directly into a png file into the project1 folder
png("./project1/plot2.png", width=480, height=480)
with(data,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"));
dev.off()
