# --------------------------------------------------- 
# Introduction to Data in R - Sampling strategies 
# 20 set 2020 
# VNTBJR 
# --------------------------------------------------- 
#
# Sampling strategies  -------------------------------------------
# Simple random sampling
# Randomly select cases from the population, such that each case is equally 
# likely to be selected. Ex: Randomly drawing names from a hat, or species 
# from a forest patch

# Stratified sampling
# First divide the population into homogeneous groups, called strata, and 
# then randomly sample from within each stratum. Ex. Divide population in 
# different groups, such as people from low, medium and high socioeconomic 
# status, or individuals of small, medium, and large forest fragment sizes
# and then sample from within each group.
 
# Cluster sampling 
# Divide the population into clusters, randomly sample a few clusters, and 
# then sample all observations within these clusters. The clusters, unlike 
# strata in stratified sampling, are heterogeneous within themselves
# and each cluster is similar to the others, such that we can get away with 
# with sampling from just a few of the clusters.

# Multistage sampling
# Another step to Cluster sampling. Divide the population into clusters, 
# randomly sample a few clusters, and then randomly sample observations from
# within those clusters. Cluster and multistage sampling are often used for 
# economical reasons. Ex: one might divide a city into geographic regions 
# that are on average similar to each other and then sample randomly from a 
# few randomly picked regions in order to avoid traveling to all regions.
 
######################################################################
# Sampling in R  -------------------------------------------
# load packages
library(openintro)
library(dplyr)

# Load county data 
data(county)

# Remove DC
county_noDC <- county %>% 
  filter(state != "District of Columbia") %>% 
  droplevels()

# Simple random sample of 150 counties
county_srs <- county_noDC %>% 
  slice_sample(n = 150)

# Glimpse couty_srs
glimpse(county_srs)

# SRS state distribution
county_srs %>% 
  group_by(state) %>% 
  count()

# Stratified sample - Obtain equal numbers of counties of each state 
# (three counties per state), where each state is a stratum
county_str <- county_noDC %>% 
  group_by(state) %>% 
  slice_sample(n = 3)

# State distribution of stratified sample counties
glimpse(county_str)

# Exercise
# Simple random sample in R
# Load packages
library(miceadds)

# Load data
load.Rdata(filename = "Datasets/us_regions.RData", objname = "us_regions")

# Glimpse us_regions
glimpse(us_regions)

# Simple random sample: states_srs
states_srs <- us_regions %>%
  slice_sample(n = 8)

# Count states by region
states_srs %>%
  count(region)

# Stratified sample in R
# Stratified sample
states_str <- us_regions %>%
  group_by(region) %>%
  slice_sample(size = 2)

# Count states by region
states_str %>%
  count(region)
 
######################################################################
# Principles of experimental design  -------------------------------------------
# Control - compare the treatment of interest to a 
# control group

# Randomize - randomly assign subjects to treatments

# Replicate - collect sufficiently large sample within a study or to 
# replicate the entire study

# Block - account for the potential effect of known or suspected 
# confounding variables
# 1 - Group subjects into blocks based on these variables;
# 2 - Randomize within each block to treatment groups

######################################################################
