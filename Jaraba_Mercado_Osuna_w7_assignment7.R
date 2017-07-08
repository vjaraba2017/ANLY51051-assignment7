#Assignment 7

#1. Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)
# ANDREA

clean_data[2:1377,3]<-"Birmingham"
clean_data[1379:1724,3]<-"Coventry"
clean_data[1726:1878,3]<-"Dudley"
clean_data[1880:2045,3]<-"Solihull"
clean_data[2047:2237,3]<-"Sandwell"
clean_data[2239:2575,3]<-"Walsall"
clean_data[2577:2868,3]<-"Wolverhampton"
clean_data[2870:4065,3]<-"Birmingham"
clean_data[4067:4308,3]<-"Coventry"
clean_data[4310:4431,3]<-"Dudley"
clean_data[4433:4572,3]<-"Solihull"
clean_data[4574:4739,3]<-"Sandwell"
clean_data[4741:5020,3]<-"Walsall"
clean_data[5022:5279,3]<-"Wolverhampton"

#2. Remove special characters, padding (the white space before and after the text) from Street 1 and Street 2 
#variables. Make sure the first letters of street names are capitalized and the street denominations are 
#following the same standard (for example, all streets are indicated as "str.", avenues as "ave.", etc.
# VERONICA 



#3. If the value in Street 2 duplicates the value in Street 1, remove the value in Street
# RAFAEL

library(stringr)

clean_data <- dirty_data #Copy in a new data.frame
clean_data[!(clean_data$Street==clean_data$`Street 2`), 4] <- NA #Remove duplicates in Street 2
clean_data$Street <- iconv(clean_data$Street,to="ASCII//TRANSLIT") #Clean special Characters
clean_data$Street <- gsub("[I?]", " ", clean_data$Street) #Remove special Characters due previous command
clean_data$Street <- str_to_title(clean_data$Street) #Capitalize first letter
clean_data$Street <- gsub("Street", "str.", clean_data$Street) 
clean_data$Street <- gsub("Road", "rd.", clean_data$Street)
clean_data$Street <- gsub("Avenue", "av.", clean_data$Street)
clean_data$Street <- gsub("Drive", "dr.", clean_data$Street)

                                                                                                                                                                                                                                          
#4. Remove the "Strange HTML column"
# ANDREA

str(clean_data)
names(clean_data)
head(clean_data)
ncol(clean_data)

library(ggplot2)
install.packages("dplyr")
library(dplyr)
clean_data.final <-clean_data %>% select(X,Year,Area,Street,Street.2)
names(clean_data.final)
head(clean_data.final)
ncol(clean_data.final)

