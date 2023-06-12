## Introduction to R

# Downloading data
# We are going to directly download the data from the Figshare repository
download.file("https://ndownloader.figshare.com/files/11492171",
              "data/SAFI_clean.csv", mode = "wb")

# Installing packages
#install.packages("tidyverse")

# R as a calculator
2 + 16 
123/56

area_hectares <- 1.0 # assign 1.0 to an object called area_hectares
area_hectares # typing the name of the object prints the value

2.47 * area_hectares # convert area into acres
area_hectares <- 10 # change the value of area_hectares
2.47 * area_hectares # convert into acres again

area_acres <- 2.47 * area_hectares # store area in acres in a new object

area_hectares <- 50 

## EXERCISE 1
r_length <- 5.6
r_width <- 2.3
r_area <- r_length * r_width
r_area 

# Functions
round(3.14159) # run the round() function with pi as an argument
round(pi) # R knows pi
args(round) # show the arguments of the round() function
?round # show Help for the round() function
round(3.14159, digits = 2) # round pi to 2 decimal points using the digits argument
round(3.14159, 2) # we can remove the name of the argument when using exactly the same order
round(digits = 2, x = 3.14159) # we can switch the orde if we name the arguments

# EXERCISE 2
floor(1.624)

# Vectors and data types
hh_members <- c(3, 7, 10, 6) # using the c() we create a vector of 4 numbers
hh_members
respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks") # create a vector of 3 character elements
respondent_wall_type

length(hh_members) # return the number of elements in the hh_members vector
length(respondent_wall_type) # no. of elements in the respondent_wall_type vector

typeof(hh_members) # what type of object is hh_members?
typeof(respondent_wall_type) # what type of object is respondent_wall_type?

str(hh_members) # str() provides an overview of the structure of the hh_members object

posessions <- c("bicycle", "radio", "television") # create a new character vector with posessions
posessions <- c(posessions, "mobile_phone") # add an extra element to te end of the existing vector
posessions <- c("car", posessions) # add extra element at the beginning of the vector
posessions

## EXERCISE 3
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

## Subsetting

respondent_wall_type[2] # retrieves the second item in the vector 
respondent_wall_type[ c(1,2) ] # retrieves items 1 and 2

more_wall_types <- respondent_wall_type[ c(1,2,3,2,2,3,1) ]


hh_members
hh_members[ c( TRUE , FALSE , TRUE , FALSE) ]
less_members <- hh_members[ c( TRUE , FALSE , TRUE , FALSE) ]
hh_members > 5
hh_members[ hh_members > 5 ]
hh_members[ hh_members >= 4 | hh_members <= 7]
hh_members[ hh_members >= 4 & hh_members <= 7]

posessions[ posessions == 'radio']
