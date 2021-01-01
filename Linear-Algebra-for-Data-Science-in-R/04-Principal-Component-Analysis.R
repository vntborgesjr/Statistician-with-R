# -------------------------------------------------
# Linear Algebra for Data Science in R - Principal Component Analysis
# 30 dez 2020
# VNTBJR
# ------------------------------------------------
# 
# Intro to the Idea of PCA ------------------------------------------------
# Finding Redundances
# Print the first 6 observations of the dataset
combine <- read.table("Datasets/combine.txt", header = TRUE)

# Print the first 6 observations of the dataset
head(combine)

# Find the correlation between variables forty and three_cone
cor(combine$forty, combine$three_cone)


# The Linear Algebra Behind PCA ------------------------------------------------
# Standardizing Your Data
# Extract columns 5-12 of combine
A <- combine[, 5:12]

# Make A into a matrix
A <- as.matrix(A)

# Subtract the mean of each column
A[, 1] <- A[, 1] - mean(A[, 1])
A[, 2] <- A[, 2] - mean(A[, 2])
A[, 3] <- A[, 3] - mean(A[, 3])
A[, 4] <- A[, 4] - mean(A[, 4])
A[, 5] <- A[, 5] - mean(A[, 5])
A[, 6] <- A[, 6] - mean(A[, 6])
A[, 7] <- A[, 7] - mean(A[, 7])
A[, 8] <- A[, 8] - mean(A[, 8])

# Create matrix B from equation in instructions
B <- t(A)%*%A/(nrow(A) - 1)

# Compare 1st element of the 1st column of B to the variance of the first column of A
B[1,1]
var(A[, 1])

# Compare 1st element of 2nd column of B to the 1st element of the 2nd row of B to the covariance between the first two columns of A
B[1, 2]
B[2, 1]
cov(A[, 1], A[, 2])

# Eigenanalyses of Combine Data
# Find eigenvalues of B
V <- eigen(B)

# Print eigenvalues
print(V$values)

V$values/sum(V$values) * 100

# Performing PCA in R ------------------------------------------------
# Scaling Data Before PCA
# Scale columns 5-12 of combine
B <- scale(combine[, 5:12])

# Print the first 6 rows of the data
prcomp(B)

# Summarize the principal component analysis
summary(prcomp(B))

# Summarizing PCA in R
# Subset combine only to "WR"
combine_WR <- subset(combine, position == "WR")

# Scale columns 5-12 of combine_WR
B <- scale(combine_WR[, 5:12])

# Print the first 6 rows of the data
head(B)

# Summarize the principal component analysis
summary(prcomp(B))


