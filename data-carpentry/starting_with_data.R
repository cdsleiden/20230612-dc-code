
library(tidyverse)
library(here)

#install.packages('here')

interviews <- read_csv( here('data','SAFI_clean.csv') , na = 'NULL' )

class(interviews)


head(interviews) # first 6 rows
tail(interviews) # last 6 rows
names(interviews) # columns names
nrow(interviews) # number of rows
ncol(interviews) # number of columns
dim(interviews)

str(interviews) # structure of the data frame
summary(interviews) # summary statistics

interviews[ 1 , 1 ] # row 1 and column 1
interviews[ 5 , 6 ] # row 5 and columh 6
interviews[ 1:5 , 2:5  ]
interviews[ 1 ,  ] # first row
interviews[ , 2 ] # second column
class(interviews[ , 2 ])

items_owned <- interviews$items_owned # values in this column 'items_owned' as a vector
class(interviews$items_owned)

# Exercise 1

interview_100 <- interviews[ 100 , ]

n_row <- nrow(interviews)
interview_last <- interviews[ n_row ,  ]

# Factors

wall_types <- factor(interviews$respondent_wall_type)
wall_types
nlevels(wall_types)

plot(wall_types)

levels(wall_types) # see the unique options
levels(wall_types)[1] <- 'Burntbricks'
levels(wall_types)

# Exercise 3

members_assoc <- factor(interviews$memb_assoc)
nlevels(members_assoc)
levels(members_assoc)
levels(members_assoc)[1] <- "No"
levels(members_assoc)[2] <- "Yes"
plot(members_assoc)

# Dates


