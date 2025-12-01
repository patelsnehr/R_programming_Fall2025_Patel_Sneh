\name{analyze_feature_importance}
\alias{analyze_feature_importance}
\title{Analyze Feature Importance}
\usage{
analyze_feature_importance(data)
}
\arguments{
\item{data}{Data frame with columns V1-V9 and class.}
}
\value{
Data frame with columns: Feature, Benign_Mean, Malignant_Mean, Difference,
Importance_Score (0-100). Sorted by importance.
}
\description{
Calculates which cellular characteristics best distinguish benign from malignant
tumors by comparing mean values across diagnostic groups.
}
\examples{
\dontrun{
data(biopsy)
importance <- analyze_feature_importance(biopsy)
print(importance)
}
}
\author{Sneh Patel (\email{prs23@usf.edu})}
