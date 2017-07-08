#Assignment 7

#1. Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)

# ANDREA

#2. Remove special characters, padding (the white space before and after the text) from Street 1 and Street 2 
#variables. Make sure the first letters of street names are capitalized and the street denominations are 
#following the same standard (for example, all streets are indicated as "str.", avenues as "ave.", etc.

#3. If the value in Street 2 duplicates the value in Street 1, remove the value in Street  

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


                                                                                                                                                                                                                                            

# RAFAEL

#4. Remove the "Strange HTML column"

# ANDREA