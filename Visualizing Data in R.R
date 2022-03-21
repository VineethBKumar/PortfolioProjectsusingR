library(tidyverse)
library(gapminder)
?gapminder

View(gapminder)

#------------------Visualizing Data in the Gapminder Dataset-------------------#

gapminder %>% 
  filter(continent %in% c("Africa", "Europe")) %>% 
  filter(gdpPercap < 30000) %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             size = pop,
             color = year))+
  geom_point()+
  facet_wrap(~continent)+
  labs(title = "Life Expectancy explained by GDP Per Capita",
       x = "GDP Per Capita",
       y = "Life Expectancy")
  





![Visualizing Data in R](https://user-images.githubusercontent.com/98186721/159338875-cdba43f5-3211-406a-8c79-0813df22e130.png)
