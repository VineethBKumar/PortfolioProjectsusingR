library(tidyverse)
data()

?msleep
View(msleep)

#---------------------Manipulating the Mammals Sleep Dataset-------------------#

glimpse(msleep)

#Rename a Variable

msleep %>% 
  rename("conserv" = "conservation") %>% 
  glimpse()

#Reordering Variables

msleep %>% 
  select(vore, name, everything())

#Changing a Variable Type

class(msleep$vore)

msleep$vore <- as.factor(msleep$vore)
class(msleep$vore)

msleep %>% 
  mutate(vore = as.character(vore)) %>% 
  glimpse()

#Select Variables to work with

names(msleep)

msleep %>% 
  select( 2:4, awake, starts_with("sleep"), contains("wt")) %>% 
  names()

#Filtering and Arranging Data

unique(msleep$order)

msleep %>% 
  filter((order == "Carnivora" | order == "Primates")
         & sleep_total > 8) %>% 
  select(name, order, sleep_total) %>% 
  arrange(-sleep_total) %>% 
  View()

#Changing Observations

msleep %>% 
  mutate(brainwt = brainwt * 1000) %>% 
  View()

msleep %>% 
  mutate(brainwt_in_grams = brainwt * 1000) %>% 
  View()

#Conditional change using if_else

msleep$brainwt
msleep$brainwt > 0.01

size_of_brain <- msleep %>% 
  select(name, brainwt) %>% 
  drop_na(brainwt) %>% 
  mutate(brain_size = if_else(brainwt > 0.01,
                              "Large",
                              "Small"))
size_of_brain

#Recoding Data and Renaming a Variable 

size_of_brain %>% 
  mutate(brain_size = recode(brain_size, 
                             "Large" = 1,
                             "Small" = 2))


#Reshaping Data from Long to Wide or Wide to Long

##--------------------Using a new Dataset called Gapminder--------------------##

library(gapminder)
?gapminder
View(gapminder)

data <- select(gapminder, country, year, lifeExp)
View(data)

wide_data <- data %>% 
                pivot_wider(names_from = year, values_from = lifeExp)
View(wide_data)

long_data <- wide_data %>% 
                pivot_longer(2:13, names_to = "year", values_to = "lifeExp")
View(long_data)
