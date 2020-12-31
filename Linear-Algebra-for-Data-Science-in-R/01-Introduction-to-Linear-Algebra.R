# -------------------------------------------------
# Linear Algebra for Data Science in R - Introduction to Linear Algebra
# 30 dez 2020
# VNTBJR
# ------------------------------------------------
# 
# Creating vectors ------------------------------------------------
# Creating three 3's and four 4's, respectively
rep(3, 3)
rep(4, 4)

# Creating a vector with the first three even numbers and the first three odd numbers
seq(2, 6, by = 2)
seq(1, 5, by = 2)

# Re-creating the previous four vectors using the 'c' command
c(3, 3, 3)
c(4, 4, 4, 4)

c(2, 4, 6)
c(1, 3, 5)

# The Algebra of Vectors
x <- 1:7
y <- seq(2, 14, 2)
z <- c(1, 1, 2)

# Add x to y and print
print(x + y)

# Multiply z by 2 and print
print(2 * z)

# Multiply x and y by each other and print
print(x * y)

# Add x to z, if possible, and print
print(x + z)

# Creating Matices in R
# Create a matrix of all 1's and all 2's that are 2 by 3 and 3 by 2, respectively
matrix(1, nrow = 2, ncol = 3)

print(matrix(2, nrow = 3, ncol = 2))

# Create a matrix B and changing the byrow designation.
B <- matrix(c(1, 2, 3, 2), nrow = 2, ncol = 2, byrow = FALSE)
B <- matrix(c(1, 2, 3, 2), nrow = 2, ncol = 2, byrow = TRUE)
B

# Add A to the previously-created matrix B
A + B

# Matrix Multiplication as a Transformation
A <- matrix(c(4, 0, 0, 1), ncol = 2)
B <- matrix(c(1, 0, 0.0000, 0.6666667), ncol = 2)
b <- c(1, 1)

# Multiply A by b
A %*% b

# Multiply B by b
B %*% b

# Reflections
A <- matrix(c(-1, 0, 0, 1), ncol = 2)
B <- matrix(c(1, 0, 0, -1), ncol = 2)
b <- c(2, 1)
C <- matrix(c(-4, 0, 0, -2), ncol = 2)

# Multiply A by b
A%*%b

# Multiply B by b 
B%*%b

# Multiply C by b 
C%*%b

# Matrix Multiplication - Order Matters
# Multiply A by B
A%*%B

# Multiply A on the right of B
B%*%A

# Multiply the product of A and B by the vector b
A%*%B%*%b

# Multiply A on the right of B, and then by the vector b
B%*%A%*%b

# Intro to The Matrix Inverse
A <- matrix(c(1, -1, 2, 2), ncol =2)

# Take the inverse of the 2 by 2 identity matrix
solve(diag(2))

# Take the inverse of the matrix A
Ainv <- solve(A)

# Multiply A inverse by A
Ainv%*%A

# Multiply A by its inverse
A%*%Ainv
