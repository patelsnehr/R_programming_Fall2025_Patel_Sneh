# Buggy version (produces the error) --------------------------------------

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# Tukey outlier helper function
tukey.outlier <- function(y) {
  qnt <- quantile(y, probs = c(0.25, 0.75))
  H <- 1.5 * IQR(y)
  (y < (qnt[1] - H)) | (y > (qnt[2] + H))
}

# Generate a test matrix
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# Try the buggy function and catch the error
cat("---- Running buggy function (expect error) ----\n")
tryCatch(
  tukey_multiple(test_mat),
  error = function(e) message("Error message: ", e$message)
)


# Corrected version (works properly) --------------------------------------

corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

cat("\n---- Running corrected function ----\n")
print(corrected_tukey(test_mat))
