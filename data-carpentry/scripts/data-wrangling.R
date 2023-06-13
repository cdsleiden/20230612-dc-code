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

# split - apply-combine 

# average HH size by village 
interviews %>%
  group_by(village) %>%
  summarize(avg_no_membrs = mean(no_membrs))

interviews %>%
  group_by(village, memb_assoc) %>%
  summarise(avg_no_membrs = mean(no_membrs)) %>%
  filter(!is.na(memb_assoc))

 interviews %>%
   group_by(village, memb_assoc) %>%
   summarise(avg_no_membrs = mean(no_membrs), 
             min_room = min(rooms))
 
 #Exercise 3 
 
 interviews %>%
   group_by(village) %>%
   summarise(avg_no_membrs = mean(no_membrs),
             min_no_membrs = min(no_membrs), 
             max_no_membrs = max(no_membrs),
             n = n()
   )
 
 # count 
 interviews %>%
   group_by(village) %>%
   count()
 
 interviews %>%
   count(village)
 
 # reshaping with tidyr
 
 # convert to wide(r) format
 interviews_wide <- interviews %>%
   mutate(wall_type_logical = TRUE) %>%
   pivot_wider( names_from = respondent_wall_type,
                values_from = wall_type_logical, 
                values_fill = FALSE )

 
 # convert to long(er) format 
 
 interviews_long <- interviews_wide  %>%
   pivot_longer(cols = c(muddaub, cement, sunbricks, burntbricks),
                names_to = "respondent_wall_type", 
                values_to = "wall_type_logical") %>%
   filter(wall_type_logical == TRUE) %>%
   select(-wall_type_logical)

 interviews_long
View(interviews_long) 


# Code for data vis 

interviews_plotting <- interviews %>%
  ## pivot longer by items_owned
  separate_rows(items_owned, sep = ";") %>%
  ## if there were no items listed, changing NA to no_listed_items
  replace_na(list(items_owned = "no_listed_items")) %>%
  mutate(items_owned_logical = TRUE) %>%
  pivot_wider(names_from = items_owned,
              values_from = items_owned_logical,
              values_fill = list(items_owned_logical = FALSE)) %>%
  ## pivot wider by months_lack_food
  separate_rows(months_lack_food, sep = ";") %>%
  mutate(months_lack_food_logical = TRUE) %>%
  pivot_wider(names_from = months_lack_food,
              values_from = months_lack_food_logical,
              values_fill = list(months_lack_food_logical = FALSE)) %>%
  ## add some summary columns
  mutate(number_months_lack_food = rowSums(select(., Jan:May))) %>%
  mutate(number_items = rowSums(select(., bicycle:car)))

## save the dataframe to our data_output directory
write_csv(interviews_plotting, file = here("data_output/interviews_plotting.csv"))
