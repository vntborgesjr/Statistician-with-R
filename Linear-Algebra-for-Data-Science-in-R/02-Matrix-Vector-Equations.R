# -------------------------------------------------
# Linear Algebra for Data Science in R - Matrix-Vector Equations
# 30 dez 2020
# VNTBJR
# ------------------------------------------------
# 
# Solving Matrix-Vector Equations ------------------------------------------------
# Exploring WNBA Data
library(tidyverse)
M <- read_csv("Datasets/wnba.csv")
M <- as.matrix(M[1:12, 1:12])
f <- as.matrix(read_csv("Datasets/differentials.csv"))

# Print the Massey Matrix M
print(M)

# Print the vector of point differentials f 
print(f)

# Find the sum of the first column of M
sum(M[, 2])

# Find the sum of the vector f
sum(f)

# Matrix-Vector Equations - Some Theory ------------------------------------------------
# Adjusting the Massey Matrix
# Add a row of 1's
M_2 <- rbind(M, rep(1, 12))

# Add a column of -1's 
M_3 <- cbind(M_2, rep(-1, 13))

# Change the element in the lower-right corner of the matrix
M_3[13, 13] <- 1

# Print M_3
print(M_3)

# Inverting the Massey Matrix

#Find the inverse of M
solve(M_3)

# Solving Matrix-Vector Equations ------------------------------------------------
# The Regular Matrix Inverse Method   
# 2017 WNBA Ratings!
M <- M_3
# Solve for r and rename column
r <- solve(M)%*%f
colnames(r) <- "Rating"

# Print r
print(r)

# Other Considerations for Matrix-Vector Equations ------------------------------------------------
# Row Reduction (By hand, dfifficult for big problems)
# Least Squares (if more rows than columns - used in linear regression)
# Singular Value Decomposition (if more columns than rows - used in PCA)
# Generalized or pseudo-inverse 
# Alternatives to the Regular Matrix Inverse
library(MASS)

# Print M
print(M)

# Find the rating vector the conventional way
r <- solve(M)%*%f
colnames(r) <- "Rating"
print(r)

# Find the rating vector using ginv (Moore-Penrose Generalized Inverse)
r <- ginv(M)%*%f
colnames(r) <- "Rating"
print(r)

