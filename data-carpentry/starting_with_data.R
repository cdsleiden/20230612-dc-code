
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
