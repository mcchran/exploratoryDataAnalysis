### Some notes ###
##

So the four scripts located to the 
specific repository (**plotX.n**) access the **household_power_consumption.txt** to produce
the corresponding plots.

**Note that** the scripts and household_power_consumption.txt file have to be located under the same directory. Moreover **lubridate** r pagkage is required. Especially **dplyr** package is required for the **plot1.R**, however due to issues of subseting POSSIXlt objects further **plotX** versions do not use dyplr.

Dataset found at:
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip