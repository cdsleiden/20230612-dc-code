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

# filtering with OR statement
filter(interviews, village == "Chirodzo" |
         rooms > 1 |
         no_meals >2 )

# Pipes 

# filter & select with intermediate steps 

interviews_temp <- filter(interviews, village == "Chirodzo")

interviews_ch <-select(interviews_temp, village:respondent_wall_type)


# nest functions 
interviews_ch <-select(filter(interviews, village == "Chirodzo"),
                       village:respondent_wall_type)

# Use pipes 

interviews_ch <- interviews %>% 
  filter(village == "Chirodzo") %>%
  select(village:respondent_wall_type)

# Exercise 1

interviews_ma <- interviews %>%
  filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)

interviews_ma

# average number of HH members per room

interviews %>%
  mutate(people_per_room = no_membrs / rooms ) %>%
  select(people_per_room)

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  mutate(people_per_room = no_membrs / rooms) %>%
  select(people_per_room)

# Exercise 2 

interviews_vil <- interviews %>%
  mutate(total_meals = no_meals * no_membrs) %>%
  select(village, total_meals) %>%
  filter(total_meals > 20 )

interviews_vil


