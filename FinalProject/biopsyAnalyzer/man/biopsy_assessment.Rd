\name{biopsy_assessment}
\alias{biopsy_assessment}
\title{Create Biopsy Assessment Object}
\usage{
biopsy_assessment(ID, V1, V2, V3, V4, V5, V6, V7, V8, V9,
                 actual_class = NULL)
}
\arguments{
\item{ID}{Character/numeric. Patient identifier.}
\item{V1}{Numeric (1-10). Clump thickness.}
\item{V2}{Numeric (1-10). Uniformity of cell size.}
\item{V3}{Numeric (1-10). Uniformity of cell shape.}
\item{V4}{Numeric (1-10). Marginal adhesion.}
\item{V5}{Numeric (1-10). Single epithelial cell size.}
\item{V6}{Numeric (1-10) or NA. Bare nuclei.}
\item{V7}{Numeric (1-10). Bland chromatin.}
\item{V8}{Numeric (1-10). Normal nucleoli.}
\item{V9}{Numeric (1-10). Mitoses.}
\item{actual_class}{Character. Optional actual diagnosis: "benign" or "malignant".}
}
\value{
S3 object of class "biopsy_assessment" containing patient_id, features,
risk_score, predicted_class, risk_level, and actual_class.
}
\description{
Creates comprehensive S3 assessment object with risk scoring and classification.
Includes custom print method for display.
}
\examples{
assessment <- biopsy_assessment(
  ID = "12345", V1 = 5, V2 = 1, V3 = 1, V4 = 1, V5 = 2,
  V6 = 1, V7 = 3, V8 = 1, V9 = 1, actual_class = "benign"
)
print(assessment)
}
\author{Sneh Patel (\email{prs23@usf.edu})}
