# Define matrices
A <- matrix(1:100, nrow = 10)    # 10x10 square matrix (singular)
B <- matrix(1:1000, nrow = 10)   # 10x100 non-square matrix

# Inspect dimensions
cat("Dimensions of A:", dim(A), "\n")  # Expected: 10 10
cat("Dimensions of B:", dim(B), "\n")  # Expected: 10 100

# Attempt to compute inverse and determinant for A
cat("\nAttempting inverse and determinant for matrix A:\n")
detA <- tryCatch(det(A), error = function(e) e)
cat("Determinant of A:\n")
print(detA)

invA <- tryCatch(solve(A), error = function(e) e)
cat("Inverse of A:\n")
print(invA)

# Attempt to compute inverse and determinant for B (non-square)
cat("\nAttempting inverse and determinant for matrix B:\n")
detB <- tryCatch(det(B), error = function(e) e)
cat("Determinant of B:\n")
print(detB)

invB <- tryCatch(solve(B), error = function(e) e)
cat("Inverse of B:\n")
print(invB)

# For demonstration, define a non-singular matrix C and compute inverse and determinant
cat("\nDefining a non-singular matrix C (2x2) for comparison:\n")
C <- matrix(c(1, 7, 4, 2), nrow = 2)
cat("Matrix C:\n")
print(C)

detC <- det(C)
cat("Determinant of C:\n")
print(detC)

invC <- solve(C)
cat("Inverse of C:\n")
print(invC)
