# plot1.R
#==============

# Create a directory & download the data if necessary
if (!dir.exists("./project1")) dir.create("project1");
if (!file.exists("./exdata-data-household_power_consumption.zip")){
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip("./exdata-data-household_power_consumption.zip",list = FALSE, exdir="./project1", overwrite = TRUE); # extraiem el fitxer
}
# Read the data
data<-read.table("./project1/household_power_consumption.txt", sep=";",header=TRUE, na.strings = c("?",""), stringsAsFactors=FALSE,dec=".");

## Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y");
library(dplyr);
data<-filter(data,Date>="2007-02-01" & Date<="2007-02-02"); 

# Create the plot directly into a png file into the project1 folder
png("./project1/plot1.png", width=480, height=480);
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power");
dev.off()
