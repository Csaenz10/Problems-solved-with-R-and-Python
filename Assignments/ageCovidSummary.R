rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()


#### 1. Load the following libraries ####
# install if necessary

install.packages("readxl")
install.packages("janitor")
install.packages("lubridate")
library(tidyverse)
library(readxl)
library(janitor)
library(lubridate)


#### 2. Read the data from age_count_2020-07-13_2020-10-11.xlsx ... ####
# into a tibble named covid_cases_age
 
# Read in Demographic Data.
# Format column names, add new column "date", format with ymd() 
# Add column "age_class",that sorts values from age_years
# into proper 20yr age bin.
# Group the tibble by date and age_class.
# Use summarise() so that each row is a unique combination of 
# date and age_class, 
# and the number of positive cases in each age class on each date
# is stored in a column called new_cases.

covid_cases_age <- bind_rows(read_excel('./age_count_2020-07-13_2020-10-11.xlsx', sheet = "Jul"),
                             read_excel('./age_count_2020-07-13_2020-10-11.xlsx', sheet = "Aug"),
                             read_excel('./age_count_2020-07-13_2020-10-11.xlsx', sheet = "Sep"),
                             read_excel('./age_count_2020-07-13_2020-10-11.xlsx', sheet = "Oct")) %>%

  clean_names() %>%
  mutate(date = ymd(labdate)) %>%
  select(-labdate) %>%
  mutate(age_class = case_when(
    age_years < 20 ~ "0-19",
    age_years >= 20 & age_years < 40 ~ "20-39",
    age_years >= 40 & age_years < 60 ~ "40-59",
    age_years >= 60 & age_years < 80 ~ "60-79",
    age_years >= 80 ~ "80+")) %>%
  group_by(date, age_class) %>%
  summarise(new_cases = n())

str(covid_cases_age)
covid_cases_age






#### 3. Create the following plot from covid_cases_age ####

covid_cases_age %>%
  ggplot(aes(x = date, y = new_cases, color = age_class)) +
  geom_point() +
  geom_smooth(se = FALSE)  +
  theme_classic()


#### 4. Recreate the following plot from covid_cases_age ####
# Hints:
# refer to lecture 8 where we used functions to add day of week and month to a tibble
# refer to text book/web for solution to making error bars,
# you will need to calculate the mean and sd for each row before initiating the plot
# search the web for solution to allowing y axes to freely vary depending upon age class
# the R Graphics Cookbook could be useful here

covid_cases_age %>%
  mutate(day = wday(date, label=TRUE, abbr=TRUE),
         month = month(date, label=TRUE, abbr=TRUE)) %>%
  group_by(day, month, age_class) %>%
  summarise(mean_new_cases = mean(new_cases), sd_new_cases = sd(new_cases)) %>%
  ggplot(aes(x = day, y = mean_new_cases)) +
  geom_col() +
  geom_smooth() +
  theme_classic() +
  facet_grid(age_class ~ month, scales ="free") +
  geom_errorbar(aes(ymin = mean_new_cases - sd_new_cases, ymax = mean_new_cases + sd_new_cases, width=0.2))
  




#### 5. There are different numbers of people in the age brackets... ####
# and thus we might expect more positive cases in some age brackets than others. 
# Read in Texas_Age_Demographic_Data.csv file & process it down to a tibble named nueces_demographics, with
# just the total number of people in each 20 year age bracket in Nueces county using tidyverse commands.
# The tibble should have 5 rows and 2 columns.
# Name the columns age_class and num_people

nueces_demographics <- (read_csv('./Texas_Age_Demographic_Data.csv')) %>%
  clean_names() %>%
  mutate(age_class = case_when (
    age < 20 ~ "0-19",
    age >= 20 & age < 40 ~ "20-39",
    age >= 40 & age < 60 ~ "40-59",
    age >= 60 & age < 80 ~ "60-79",
    age >= 80 ~ "80+")) %>%
  filter(county == "NUECES COUNTY") %>%
  slice_tail(n = 96) %>%
  group_by(age_class) %>%
  summarise(num_people = sum(total))



str(nueces_demographics)

#### 6. Recreate the following plot with... ####
# the data in the nueces_demographics tibble.
# The font size of the axis titles is 20
# The font size of the axis values is 18. 
# Hint: the R Graphics Cookbook could be useful here.

ggplot(nueces_demographics, aes(x = age_class, y = num_people)) +
  geom_col(fill = "blue", colour = "blue")


#### 7. Now we can use the demographic data to... ####
# calculate the number of new cases 
# relative to the number of people in each age class.
# Join covid_cases_age and nueces_demographics together
# and save the new tibble as covid_cases_age_census.
# Add a column named new_cases_per10k with values calculated as follows:
# 10000*new_cases/num_people.
# The result will be a tibble like covid_cases_age
# but with 2 additional columns

covid_cases_age_census <- full_join(covid_cases_age, nueces_demographics) %>%
  mutate(new_cases_per10k= 10000*new_cases/num_people)

covid_cases_age_census



#### 8. I have noticed a pattern where the elderly are... ####
# the last age group to experience a spike in COVID cases after a local outbreak.
# Modify your code from question 3
# to make a plot with new_cases_per10k on the y axis.
# Is the figure consistent with my observations from other time periods? 
# Which figure, this one or the one from question 3 
# better portrays the level of COVID infection within and among age classes? Why?

covid_cases_age_census %>%
  ggplot(aes(x = date, y = new_cases_per10k, color = age_class)) +
  geom_point() +
  geom_smooth(se = FALSE)  +
  theme_classic()

# This figure is consistent with the observations from other time periods,
# showing younger age classes spiking in COVID infections first in July,
# then, the elderly spiking in COVID cases in August.

# This figure better portrays the level of 
# COVID infections within and among age classes.
# It is better at showing when a spike is occurring in an age class
# because it takes new cases relative to the whole population of the age class,
# while the plot from #3 just reports new cases.
# The populations in the age classes are not equal 
# and it is important to take that into account
# when trying to determine when spikes are occurring.