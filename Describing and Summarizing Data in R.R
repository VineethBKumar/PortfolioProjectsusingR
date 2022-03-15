library(tidyverse)
data()

?msleep
View(msleep)

#-------------Describing and Summarizing the Mammals Sleep Dataset-------------#

glimpse(msleep)

#Describing the Spread, Centrality and Variance of Data

##Spread of Data

min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)

##Centrality of Data

mean(msleep$awake)
median(msleep$awake)

##Variance of Data

var(msleep$awake)

#Summarizing Selected variables

summary(msleep)

summary(msleep$sleep_total)

msleep %>% 
  select(sleep_total, brainwt) %>% 
  summary()

#Creating a Summary Table

##For each category of "vore" show the min, max, difference 
##and average "sleep_total" and arrange data by the average

msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference = max(sleep_total) - min(sleep_total)
           ) %>% 
  arrange(Average) %>% 
  View()

#Creating Contingency Tables

library(MASS)
?Cars93  

##-----------------------Using a new Dataset called Cars93--------------------##

attach(Cars93)
glimpse(Cars93)            

table(Origin)            
table(AirBags, Origin)            
addmargins(table(AirBags, Origin))

prop.table(table(AirBags, Origin)) * 100
round(prop.table(table(AirBags, Origin)) * 100)

Cars93 %>% 
  group_by(Origin, AirBags) %>%
  summarise(number = n()) %>% 
  pivot_wider(names_from = Origin, values_from = number)


  