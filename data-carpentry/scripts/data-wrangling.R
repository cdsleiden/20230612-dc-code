## load the tidyverse
library(tidyverse)
library(here)

# If you haven't downloaded the file:
#download.file("https://ndownloader.figshare.com/files/11492171",
#              "data/SAFI_clean.csv", mode = "wb")


# Assign data to the object
interviews <- read_csv(here("data", "SAFI_clean.csv"), na = "NULL")

# preview the data
# view(interviews)

# Select subset of columns 
select(interviews, village, no_membrs, months_lack_food)

# do the same with subseting
interviews[c("village", "no_membrs", "months_lack_food")]

# select series of columns
select(interviews, village:respondent_wall_type)

# keep only obs. from Chirodzo 
filter(interviews, village == "Chirodzo")

# filtering with AND statement
filter(interviews, village == "Chirodzo" &
         rooms > 1 &
         no_meals > 2)

