\name{biopsy}
\alias{biopsy}
\docType{data}
\title{Breast Cancer Biopsy Data}
\format{
Data frame with 699 rows and 11 columns:
\describe{
  \item{ID}{Sample code number}
  \item{V1}{Clump thickness (1-10)}
  \item{V2}{Uniformity of cell size (1-10)}
  \item{V3}{Uniformity of cell shape (1-10)}
  \item{V4}{Marginal adhesion (1-10)}
  \item{V5}{Single epithelial cell size (1-10)}
  \item{V6}{Bare nuclei (1-10, 16 missing values)}
  \item{V7}{Bland chromatin (1-10)}
  \item{V8}{Normal nucleoli (1-10)}
  \item{V9}{Mitoses (1-10)}
  \item{class}{"benign" or "malignant"}
}
}
\description{
Wisconsin Breast Cancer Database from University of Wisconsin Hospitals.
699 cases with 9 cellular characteristics and diagnosis.
}
\source{
University of Wisconsin Hospitals, Dr. William H. Wolberg
}
\references{
Wolberg, W. H., & Mangasarian, O. L. (1990). Multisurface method of pattern
separation for medical diagnosis applied to breast cytology. PNAS, 87, 9193-9196.
}
\examples{
data(biopsy)
head(biopsy)
table(biopsy$class)
}
\keyword{datasets}
