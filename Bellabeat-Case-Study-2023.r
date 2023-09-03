**Loading the library for datasets**
The following packages for the cleaning and analysis are loaded in the code chunk below; 

library(tidyverse)
library(dplyr)
library(janitor)
library(ggplot2)
library(lubridate)
library(tidyr)

**Importing the datasets for the analysis**
The following data sets were the focus of the analysis and will be imported below;

* dailyActivity_merged.csv
* sleepDay_merged.csv
* hourlySteps_merged.csv

Activity_data <- read_csv("/kaggle/input/bellabeat-dataset/dailyActivity_merged.csv")
Sleep_data <- read_csv("/kaggle/input/bellabeat-dataset/sleepDay_merged.csv")
Steps_data <- read_csv("/kaggle/input/bellabeat-dataset/hourlySteps_merged.csv")

**Assigning versions to the datasets.**
The datasets will be assigned version in case of a error and I have to refer to original data. 
The imported datasets will be renamed and the column names will be cleaned using the (clean_names) function to make it easier for analysis. 

Activity_data_v1 <- clean_names(Activity_data)
Sleep_data_v1 <- clean_names(Sleep_data)
Steps_data_v1 <- clean_names(Steps_data)

head(Activity_data_v1)
str(Activity_data_v1)
colnames(Activity_data_v1)

head(Steps_data_v1)
str(Steps_data_v1)
colnames(Steps_data_v1)

**Cleaning the date-time format**
The date format in the dataset is in a date-time format and will be converted to date format ("m"/"d"/"y") to make it more consitent.

Activity_data_v1$activity_date=as.POSIXct(Activity_data_v1$activity_date, format="%m/%d/%Y", tz=Sys.timezone())
Activity_data_v1$date <- format(Activity_data_v1$activity_date, format = "%m/%d/%y")
View(Activity_data_v1)

Sleep_data_v1$sleep_day = as.POSIXct(Sleep_data_v1$sleep_day, format = "%m/%d/%Y", tz=Sys.timezone())
Sleep_data_v1$sleep_day <- format(Sleep_data_v1$sleep_day, format = "%m/%d/%y")
View(Sleep_data_v1)

Steps_data_v1$activity_hour = as.POSIXct(Steps_data_v1$activity_hour, format = "%m/%d/%Y", tz=Sys.timezone())
Steps_data_v1$activity_hour <- format(Steps_data_v1$activity_hour, format = "%m/%d/%y")
View(Steps_data_v1)

**Checking for distinct id numbers**
The number of id(s) have to be checked.

n_distinct(Activity_data_v1$id)
n_distinct(Sleep_data_v1$id)
n_distinct(Steps_data_v1$id)

**Summary Statistics**
The following columns were selected from each imported data sets and a summary of each data sets were carried out. 

* Activity_data_v1: total_steps, total_distance, calories, sedentary_minutes, very_active_minutes, lightly_active_minutes, moderately_active_distance
* Sleep_data_v1: total_sleep_records, total_minutes_asleep, total_time_in_bed
*Step_data_v1: step_total

Activity_data_v1 %>%
  select(total_steps, total_distance, calories, sedentary_minutes, very_active_minutes, lightly_active_minutes, moderately_active_distance) %>%
  summary()

The average steps taken per day is 7638 and the average distance walked in a day is 5.490 kilometers. 
The recommended steps by the Centers for Disease Control and Prevention (CDC) to be taken per day is approximately 10,000 steps and the distance recommended per day is 8 kilometers per day. Users need to improve.
The average calories burned per day is 2304 and the recommended daily calorie burning is 2,000 calories a day for women and 2,500 for men, which means users are right on track.
The users spend 991.2 minutes seated which equates to 16 hours a day, 16 hours of sitting a day is highly risky and users should try to reduce it to a recommended total of 4 hours per day.
Most of the users are lightly active users.

Sleep_data_v1%>%
  select(total_sleep_records, total_minutes_asleep, total_time_in_bed) %>%
  summary()

The average minute spent alseep is 419.5 minutes which equates to about 6.9 hours a day and 458.6 minutes in bed which equates to 7.64 hours a day. 
This sleep pattern needs to be increased to about 7 and above hours which is recommended for adults.
The users also spend 1 day sleeping 6.9 hours in a day, which they need to improve to improve their health.

Steps_data_v1 %>%
  select(step_total) %>%
  summary()

**Merging data for Visualization**
We will have to merge the data (JOIN) by the "id" and "date" and "week_day" column to have one central table for the visualization.
First off, the sleep_day column from Sleep_data_v1 will be renamed into (date).

Sleep_data_v1 <- Sleep_data_v1 %>%
  rename(date = sleep_day)

Chart 1: Steps Vs. Calories

ggplot(data=Merged_data, mapping=aes(x=total_steps, y=calories)) +
  geom_point() + geom_smooth(method ="loess") +
  labs(title= "Steps Vs. Calories", subtitle ="Relationship between Steps and Calories daily", caption="Data generated from distributed survey via Amazon Mechanical Turk between 03.12.2016-05.12.2016.")

The point chart shows a positive relationship between Total Steps and Calories which shows that the more users walk, the more calories they burn. 

Chart 2: Total minutes asleep vs. Total minutes in bed.

ggplot(data=Merged_data) +
  geom_point(mapping = aes(x=total_minutes_asleep, y =total_time_in_bed)) + 
labs(title ="Total Minutes Asleep Vs. Total Minutes in Bed", subtitle ="Relationship between minutes alsleep and the minutes the users spend in bed", caption ="Data generated from distributed survey via Amazon Mechanical Turk between 03.12.2016-05.12.2016.") 

The above point chart shows that the more users spend in bed, the more time they spend asleep. 

Chart 3: Sedentary Minutes vs. Total Minutes Asleep

ggplot(data=Merged_data, mapping = aes(x=total_minutes_asleep, y=sedentary_minutes)) +
geom_point() + 
labs(title ="Sedentary Minutes Vs. Total Minutes Asleep", subtitle = "Relationship between sedentary minutes and total time the user spend asleep", caption= "Data generated from distributed survey via Amazon Mechanical Turk between 03.12.2016-05.12.2016.")

The point chart shows a negative relationship which means that as sedentary minutes decrease, the total minutes asleep increase so users need to decrease it.

Chart 4: Week days

ggplot(data=Merged_data, mapping=aes(x=week_day)) +
  geom_bar() + 
labs(title ="Week Days", subtitle = "Visualizing the most active day of the week", caption = "Data generated from distributed survey via Amazon Mechanical Turk between 03.12.2016-05.12.2016.")

This bar chart shows that the most active weekday is Wednesday.

**Recommendations**
1. The Bellabeat app should recommend the total recommended steps to be walked in a day so users can make sure to walk these steps and also promote their enthusiasm by coming up with a weekly scoreboard that users can compete for.
2. The Bellabeat app can be used by users to improve their sleep patterns by analyzing their sleep patterns and suggesting suitable times for them to sleep so they can get the most sleep recommended.
3. The Bellabeat app can help the users reduce their sedentary time by suggesting activities to be done instead and also providing articles on health benefits of having shorter sedentary time through pop-notifications. 
4. Bellabeat app can suggest activities to the users on the days when they are least active and also send users articles on benefits of being active.

These are my recommendations for Bellabeat to incorporate which answers the business question.
