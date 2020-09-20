# --------------------------------------------------- 
# Introduction to Data in R - Case Study 
# 20 set 2020 
# VNTBJR 
# --------------------------------------------------- 
#
# # Baeuty in classroom  -------------------------------------------
# Load packages
library(openintro)
library(dplyr)
library(miceadds)

# Load data
load.Rdata(filename = "Datasets/evals.RData", objname = "evals1")
evals <- evals1

# Inspect evals
glimpse(evals)

# Identify variable types
# Inspect variable types
glimpse(evals)

# Remove non-factor variables from the vector below
cat_vars <- c("score", "rank", "ethnicity", "gender", "language", "age",
              "cls_students", "cls_level", "cls_profs", "cls_credits",
              "bty_avg", "pic_outfit", "pic_color")

cat_vars <- c("rank", "ethnicity", "gender", "language", "cls_level", 
              "cls_profs", "cls_credits", "pic_outfit", "pic_color")

# Recode a variable
# Recode cls_students as cls_type
evals_fortified <- evals %>%
  mutate(
    cls_type = factor(case_when(
      cls_students <= 18 ~ "small",
      cls_students > 18 & cls_students < 60 ~ "midsize",
      cls_students >= 60 ~ "large"
    ))
  )
glimpse(evals_fortified)

# Create a scatterplot
# Load packages
library(ggplot2)

# Scatterplot of score vs. bty_avg
ggplot(data = evals, aes(x = bty_avg, y = score)) +
  geom_point()

# Create a scatterplot with an added layer
ggplot(data = evals_fortified, aes(x = bty_avg, y = score, color = cls_type)) +
  geom_point()
 
######################################################################

