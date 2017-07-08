#Assignment 7

clean_data <- dirty_data #Copy in a new data.frame

#1. Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)

clean_data[2:1377,2]<-"Birmingham"
clean_data[1379:1724,2]<-"Coventry"
clean_data[1726:1878,2]<-"Dudley"
clean_data[1880:2045,2]<-"Solihull"
clean_data[2047:2237,2]<-"Sandwell"
clean_data[2239:2575,2]<-"Walsall"
clean_data[2577:2868,2]<-"Wolverhampton"
clean_data[2870:4065,2]<-"Birmingham"
clean_data[4067:4308,2]<-"Coventry"
clean_data[4310:4431,2]<-"Dudley"
clean_data[4433:4572,2]<-"Solihull"
clean_data[4574:4739,2]<-"Sandwell"
clean_data[4741:5020,2]<-"Walsall"
clean_data[5022:5279,2]<-"Wolverhampton"

#3. If the value in Street 2 duplicates the value in Street 1, remove the value in Street

clean_data[!(clean_data$Street==clean_data$`Street 2`), 4] <- NA #Remove duplicates in Street 2

#2. Remove special characters, padding (the white space before and after the text) from Street 1 and Street 2 
#variables. Make sure the first letters of street names are capitalized and the street denominations are 
#following the same standard (for example, all streets are indicated as "str.", avenues as "ave.", etc.

library(stringr)

clean_data$Street <- iconv(clean_data$Street,to="ASCII//TRANSLIT") #Clean special Characters
clean_data$Street <- gsub("[I?]", " ", clean_data$Street) #Remove special Characters due previous command
clean_data$Street <- str_to_title(clean_data$Street) #Capitalize first letter
clean_data$Street <- gsub("Street", "str.", clean_data$Street) 
clean_data$Street <- gsub("Road", "rd.", clean_data$Street)
clean_data$Street <- gsub("Avenue", "av.", clean_data$Street)
clean_data$Street <- gsub("Drive", "dr.", clean_data$Street)

#4. Remove the "Strange HTML column"

clean_data$`Strange HTML` <- NULL

setwd("C:/Users/LSP-Laptop14-ADMIN/Desktop/ANLY51051-assignment7-master")
write.csv(clean_data, file = "clean_data.csv")
