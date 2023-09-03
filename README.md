## 1. ANALYSIS BRIEF

**Industry Focus**: Health-Focused products for Women

**Audience**: Executive Team

**Business Task**: Analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart devices.
### 1.1 Project Deliverable

a.	A clear summary of the business task
b.	A description of all data sources used
c.	Documentation of any cleaning or manipulation of data
d.	A summary of your analysis
e.	Supporting visualizations and key findings
f.	Your top high-level content recommendations based on your analysis

### 1.2 Background

In this scenario as a junior analyst, my role is to work on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for women. I have been asked to focus on one of Bellabeat’s products and analyze smart device data to gain insight into how consumers are using their smart devices.
The insights I discover will then help guide marketing strategy for the company. I will then present the analysis to the Bellabeat executive team along with high-level recommendations for Bellabeat’s marketing strategy.
### 1.3 Company History
​
Founded in 2013, Bellabeat is a successful small a high-tech company that manufactures health-focused smart products.
Bellabeat products became available through a growing number of online retailers in addition to their own e-commerce channel on their website.
​
### 1.4 Executive Concern
​
The Co-founder and Chief Creative Officer asked the marketing analytics team to focus on a Bellabeat product and analyze smart device usage data in order to gain insight into how people are already using their smart devices. 
Then, using this information, she would like high-level recommendations for how these trends can inform Bellabeat marketing strategy. 
​
## 2 ASK PHASE
### 2.1 Guiding Questions

1. Identify the business task
2. Consider key stakeholders

### 2.2 Deliverable

* A clear statement of the business task: Analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart devices
The chosen device for this analysis is the Bellabeat App that provides users with health data related to their activity, sleep, stress,
menstrual cycle, and mindfulness habits.

## 3. PREPARE PHASE
### 3.1 Guiding questions

* Where is your data stored?
* How is the data organized? Is it in long or wide format?
* Are there issues with bias or credibility in this data? Does your data ROCCC?
* How are you addressing licensing, privacy, security, and accessibility?
* How did you verify the data’s integrity?
* How does it help you answer your question?
* Are there any problems with the data?

### 3.2 Deliverables 

* A description of all data sources used

The dataset for analysis was downloaded from the [FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) uploaded on Kaggle (CC0: Public Domain, dataset made available through [Mobius](https://www.kaggle.com/arashnic)). 
The data sets included 18 sheets from Daily to Hourly to Minutes with focus on the daily activity, calories, intensities, steps, heart rate, METs, sleep, and weight log info on personal fitness trackers data collected from thirty Fitbit users between 03/12/2016 - 05/12/2016. 

Thirty eligible Fitbit users consented to the submission of personal
tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, and heart rate that can be used to explore users’ habits.

This data is deemed credible as it operates under a public domain with data made available by Mobius, a Data Scientist at Healthcare Melbourne, Victoria, Australia. 

## 4. PREPARE PHASE
### 4.1 Guiding questions
​
* What tools are you choosing and why?
* Have you ensured your data’s integrity?
* What steps have you taken to ensure that your data is clean?
* How can you verify that your data is clean and ready to analyze?
* Have you documented your cleaning process so you can review and share those results?
​
### 4.2 Deliverables
* Document the cleaning process
​
#### 4.2.1 Changing Date into Weekday
​
The data was checked with pivot tables in Excel and the time for the Daily Activity, Daily Sleep and Hourly Step data sets were manipulated into "week_day" to assist with the analysis. With 1 being *Sunday* and 7 being *Saturday*
​
#### 4.2.2 Loading the library for datasets
​
The following packages for the cleaning and analysis are loaded in the code chunk below; 
​
* Tidyverse
* dplyr
* janitor
* lubridate
* ggplot2
* tidyr

