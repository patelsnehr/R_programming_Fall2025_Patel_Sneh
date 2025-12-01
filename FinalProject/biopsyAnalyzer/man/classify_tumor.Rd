\name{classify_tumor}
\alias{classify_tumor}
\title{Classify Tumor as Benign or Malignant}
\usage{
classify_tumor(risk_score, threshold = 50)
}
\arguments{
\item{risk_score}{Numeric (0-100). Risk score from calculate_malignancy_risk().}
\item{threshold}{Numeric. Classification threshold (default: 50).}
}
\value{
Character: "benign" or "malignant"
}
\description{
Classifies tumor based on risk score threshold.
}
\examples{
classify_tumor(25)  # "benign"
classify_tumor(75)  # "malignant"
classify_tumor(50, threshold = 60)  # "benign"
}
\author{Sneh Patel (\email{prs23@usf.edu})}
