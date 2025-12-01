#' Breast Cancer Biopsy Data
#'
#' @description
#' Wisconsin Breast Cancer Database with 699 cases, 9 cellular features, and diagnosis.
#'
#' @format Data frame with 699 rows and 11 columns:
#' \describe{
#'   \item{ID}{Sample code}
#'   \item{V1-V9}{Cellular characteristics (1-10 scale)}
#'   \item{class}{"benign" or "malignant"}
#' }
#'
#' @source University of Wisconsin Hospitals, Dr. William H. Wolberg
#'
#' @examples
#' data(biopsy)
#' head(biopsy)
#' table(biopsy$class)
#'
"biopsy"
