library(tidyverse)

gapminder <- read_csv("Data/gapminder-FiveYearData.csv")

gapminder


ggplot (data = gapminder) +
      geom_jitter(mapping = aes(x = continent, y = lifeExp))

ggplot (data = gapminder) +
      geom_jitter(mapping = aes(x = continent, y = lifeExp, color = continent))+
      geom_boxplot(mapping = aes(x = continent, y = lifeExp, color = continent))


ggplot (data = gapminder, mapping = aes(x = continent, y = lifeExp, color = continent))+
    geom_jitter()+
    geom_boxplot()

ggplot (data = gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp, color = continent))+
  geom_jitter(alpha=0.5)+
  geom_smooth(method="lm")


ggplot (data = gapminder, mapping = aes(x = log(gdpPercap), y = lifeExp))+
  geom_jitter(alpha=0.5, mapping = aes(color=continent))+
  geom_smooth(method="lm")

ggplot (data = gapminder) +
  geom_boxplot(mapping = aes(x = as.factor(year), y = lifeExp))

ggplot (data = gapminder) +
  geom_boxplot(mapping = aes(x = as.factor(year), y = log(gdpPercap)))


ggplot (data = gapminder) +
  geom_density2d(mapping = aes(x = log(gdpPercap), y = lifeExp))

ggplot (data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()+
  geom_smooth(method="lm")+
  scale_x_log10()+
  facet_wrap(~ continent)


ggplot (data= filter (gapminder, year==2007))+
  geom_bar(mapping = aes(x = continent))

ggplot (data= filter (gapminder, year==2007, continent=="Oceania"))+
  geom_bar(mapping = aes(x = country, y=pop), stat="identity")

ggplot (data= filter (gapminder, year==2007, continent=="Europe"))+
  geom_bar(mapping = aes(x = country, y=pop), stat="identity")+
  coord_flip()

ggplot (data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, 
                                        color=continent, size=pop/10^6)) +
  geom_point()+
  scale_x_log10()+
  facet_wrap(~ year)+
  labs(title="Life Expectancy and GDP per capita over time", 
       subtitle="In the last 50 years life expectancy has improved in most countries",
       caption="Source: Gapminder foundation, http://www.gapminder.com",
       x="GDP per capita",
       y="Life Expectancy",
       color="Continent",
       size="Population in millions")

ggsave("my_fancy_plot.png")



