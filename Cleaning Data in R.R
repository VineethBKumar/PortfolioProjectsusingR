library(tidyverse)
View(starwars)

#------------------------Cleaning the Starwars Dataset-------------------------#

#Variable Types

glimpse(starwars)
unique(gender)

starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

starwars$gender <- factor((starwars$gender), levels = c("masculine","feminine"))

levels(starwars$gender)

#Select Variables

names(starwars)

starwars %>% 
  select(name, height, ends_with("color"))

#Filter Observations

unique(starwars$hair_color)

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blond", "brown") & height < 180)

#Missing Data

mean(starwars$height, na.rm = TRUE)

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "None"))

#Removing Duplicates

Names <- c("Tom", "John", "Mike", "Tom")
Age <- c(22,33,44,22)
friends <- data.frame(Names, Age)

friends[!duplicated(friends), ]

friends %>% 
  distinct()

#Recoding Variables

starwars %>% 
  select(name, gender)

starwars %>% 
  select(name, gender) %>% 
  mutate(gender = recode(gender, "masculine" = 1, "feminine" = 2)) %>% 
  View()
  