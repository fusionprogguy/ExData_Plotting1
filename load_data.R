# LOAD POWER CONSUMPTION DATA
#
#================================================
# DESCRIPTION
#
# This script does two main tasks:
# 1. Reads in a large file containing the power consumption data for households
# 2. Loads the source code to generate plots
#
# The large file that is loaded is called 'household_power_consumption.txt'. The file is around 130MB large. 
#
# The file contains 9 colums:
# Date; Time; 
# Global_active_power; Global_reactive_power; Voltage; Global_intensity;
# Sub_metering_1; Sub_metering_2; Sub_metering_3
#
# A description of the formats and details of the power measurements are as follows:
#
# Date: Date in format dd/mm/yyyy
# Time: Time in format hh:mm:ss
# Global_active_power: Household global minute-averaged active power (in kilowatt)
# Global_reactive_power: Household global minute-averaged reactive power (in kilowatt)
# Voltage: Minute-averaged voltage (in volt)
# Global_intensity: Household global minute-averaged current intensity (in ampere)
# Sub_metering_1: Energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: Energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: Energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#
#================================================
# LOADING SCRIPT
#
#Set the working directory (change if needed)
setwd("F:/Courses/Coursera/Exploratory Data Analysis/Week1/exdata-data-household_power_consumption")

#Test memory size. 
#Reference: http://adv-r.had.co.nz/memory.html
#install.packages("pryr")
library("pryr")

#Use 1/1000 of the 2,075,259 row length file as a sample.
power_rows <- 2075259
n <- floor(power_rows/1000)
powern <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=n)
object_size(powern)
#277 kB * 1000 = 277 MB in memory (estimate)

#Check the class of each column from the sample. 
#Reference: http://www.biostat.jhsph.edu/~rpeng/docs/R-large-tables.html
classes <- sapply(powern, class)

#Read in the table using the classes identified above. If any NA, Nan or ? are encountered, change them to NA.
global_power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=classes, na.strings=c("?"), nrows=power_rows)

#Transform the date format from dd/mm/yyyy to the standard date format yyyy-mm-dd
global_power$Date <- as.Date(global_power$Date, format = "%d/%m/%Y")

#Limit the data between these two dates
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

#Subset global power data frame with the above dates
gp.df <- global_power[(global_power$Date >= start_date) & (global_power$Date <= end_date),]

#Check the size of the data frame
#> dim(gp.df)
#[1] 1440    9

#Create a new column that is a combination of Date and Time
gp.df$DateTime <- strptime(paste(gp.df$Date, gp.df$Time), "%Y-%m-%d %H:%M:%S")
#> dim(gp.df)
#[1] 1440   10

#The resulting date frame looks like this:
#> str(gp.df)
#'data.frame':        1440 obs. of  10 variables:
#        $ Date                 : Date, format: "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" ...
#$ Time                 : Factor w/ 1440 levels "00:00:00","00:01:00",..: 1 2 3 4 5 6 7 8 9 10 ...
#$ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
#$ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
#$ Voltage              : num  243 243 244 244 243 ...
#$ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
#$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ DateTime             : POSIXlt, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" "2007-02-01 00:03:00" ...

#================================================
#PLOTS
#

#Global Parameters for all plots
plot_w <- 480  # width
plot_h <- 480  # height
plot_u <- "px"  # units
plot_bg <- "transparent"   # background colour

#Create individual plots
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")
