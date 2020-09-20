# --------------------------------------------------- 
# Introduction to data in R - Study types and cautionary tales 
# 19 set 2020 
# VNTBJR 
# --------------------------------------------------- 
#
# Observational studies and experiments  -------------------------------------------
# Identify type of study: Countries
# Load packages
library(gapminder)
library(dplyr)

# Load data
data(gapminder)

# Glimpse data
glimpse(gapminder)

# Identify type of study: observational or experimental
type_of_study <- "observational"
 
######################################################################
# Random smapling and random assignment  -------------------------------------------
 
######################################################################
# Simpson's paradox  -------------------------------------------
# Number of males and females admitted
# Load packages
library(miceadds)

# Load data
load.Rdata(filename = "Datasets/ucb_admit.RData", objname = "ucb_admit")

# Check the data
glimpse(ucb_admit)

# Count number of male and female applicants admitted
ucb_admission_counts <- ucb_admit %>%
  count(Gender, Admit)

# Proportion of males admitted overall
ucb_admission_counts %>%
  # Group by gender
  group_by(Gender) %>%
  # Create new variable
  mutate(prop = n / sum(n)) %>%
  # Filter for admitted
  filter(Admit == "Admitted")

# Proportion of males admitted for each department
ucb_admission_counts <- ucb_admit %>%
  # Counts by department, then gender, then admission status
  count(Gender, Admit, Dept)

# See the result
ucb_admission_counts

ucb_admission_counts  %>%
  # Group by department, then gender
  group_by(Dept, Gender) %>%
  # Create new variable
  mutate(prop = n / sum(n)) %>%
  # Filter for male and admitted
  filter(Gender == "Male", Admit == "Admitted")
 
######################################################################
# Recap: Simpson's paradox  -------------------------------------------
