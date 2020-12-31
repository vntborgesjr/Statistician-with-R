# -------------------------------------------------
# Linear Algebra for Data Science in R - Eigenvalues and Eigenvectors
# 30 dez 2020
# VNTBJR
# ------------------------------------------------
# 
# Intro to Eigenvalues and Eigenvectors ------------------------------------------------
# A matrix multipyed by a scalar will contract a vector (row) by a common factor

# Scaling Different Axes
A <- matrix(c(2, 0, 0, 0.6666667), ncol = 2)

# Multiply A by the given vector
print(A%*%c(1, 1))

# Eigenvalue/Eigenvector Definition ------------------------------------------------
# Eigenvectors are entirely about direction and not magnitude
# An eigenvector of A is a vector that points in its own (o complete opposite)
# direction upon multiplication by A
# An eigenvector is a scalar multiple of itself ("own") when multiplied by A!

# Finding Eigenvalus in R
A <- matrix(c(-1, 0, 0, 2, 7, 0, 4, 12, -4), ncol = 3)

# Show that 7 is an eigenvalue for A
A%*%c(0.2425356, 0.9701425, 0) - 7*c(0.2425356, 0.9701425, 0)

# Show that -4 is an eigenvalue for A
A%*%c(-0.3789810, -0.6821657, 0.6253186) - (-4)*c(-0.3789810, -0.6821657, 0.6253186)

# Show that -1 is an eigenvalue for A
A%*%c(1, 0, 0) - (-1)*c(1, 0, 0)

# Scalar Multiples of Eigenvectors are Eigenvectors
# Show that double an eigenvector is still an eigenvector
A%*%((2)*c(0.2425356, 0.9701425, 0)) - 7*(2)*c(0.2425356, 0.9701425, 0)

# Show half of an eigenvector is still an eigenvector
A%*%((0.5)*c(0.2425356, 0.9701425, 0)) - 7*(0.5)*c(0.2425356, 0.9701425, 0)

# Solving Eigenvaleu/Eigenvector Problems ------------------------------------------------
# An n by n matrix can have at most n distinct eigenvalues

# Verifying the Math on Eigenvalues
A <- matrix(c(1, 1, 2, 1), ncol = 2)

# Compute the eigenvalues of A and store in Lambda
Lambda <- eigen(A)

# Print eigenvalues
print(Lambda$values[1])
print(Lambda$values[2])

# Verify that these numbers satisfy the conditions of being an eigenvalue
det(Lambda$values[1]*diag(2) - A)
det(Lambda$values[2]*diag(2) - A)

# Computing Eigenvectors in R
# Find the eigenvectors of A and store them in Lambda
Lambda <- eigen(A)

# Print eigenvectors
print(Lambda$vectors[, 1])
print(Lambda$vectors[, 2])

# Verify that these eigenvectors & their associated eigenvalues satisfy Av - lambda v = 0
Lambda$values[1]*Lambda$vectors[, 1] - A%*%Lambda$vectors[, 1]
Lambda$values[2]*Lambda$vectors[, 2] - A%*%Lambda$vectors[, 2]

# Some More on Eigenvalues and Eigenvectors ------------------------------------------------
# The largest eignvalues characterize the application of the matrix the more  
# times it's applied

# Markov Models for Allele Frequencies
M <- matrix(c(0.98, .005, .005, .01, .005, .98, .01, .005, .005, .01, .98, .005,
              .01, .005, .005, .98), ncol = 4)
# This code iterates mutation 1000 times
x <- c(1, 0, 0, 0)
for (j in 1:1000) {x <- M%*%x}

# Print x
print(x)

# Print and scale the first eigenvector of M
Lambda <- eigen(M)
v1 <- Lambda$vectors[, 1]/sum(Lambda$vectors[, 1])

# Print v1
print(v1)

