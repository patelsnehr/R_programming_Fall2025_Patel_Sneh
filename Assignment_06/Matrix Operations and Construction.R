# Task 1: Matrix Addition & Subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Compute A + B
addition_result <- A + B
print("A + B:")
print(addition_result)

# Compute A - B
subtraction_result <- A - B
print("A - B:")
print(subtraction_result)


# Task 2: Create a Diagonal Matrix
D <- diag(c(4, 1, 2, 3))
print("Diagonal Matrix D:")
print(D)


# Task 3: Construct a Custom 5x5 Matrix
# The matrix has 3 on the diagonal except first row, 1s in first row except first column,
# and 2s in the first column except first row, 0s elsewhere.

# Create diagonal part (except first row diagonal element)
diag_matrix <- diag(c(3, 3, 3, 3))

# Create the first row: 3 1 1 1 1
first_row <- c(3, 1, 1, 1, 1)

# Create the first column except first row: 2 2 2 2 (rows 2 to 5)
first_col <- c(2, 2, 2, 2)

# Combine matrices
# Start with the diagonal matrix, add first column and first row appropriately
custom_matrix <- cbind(
  c(first_row[1], first_col),
  rbind(first_row[-1], diag_matrix)
)

print("Custom 5x5 Matrix:")
print(custom_matrix)
