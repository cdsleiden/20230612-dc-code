
library(tidyverse)
library(here)

#install.packages('here')

interviews <- read_csv( here('data','SAFI_clean.csv') , na = 'NULL' )

class(interviews)
