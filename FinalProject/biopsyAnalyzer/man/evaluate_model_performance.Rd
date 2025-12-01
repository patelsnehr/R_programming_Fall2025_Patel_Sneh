\name{evaluate_model_performance}
\alias{evaluate_model_performance}
\title{Evaluate Model Performance}
\usage{
evaluate_model_performance(data, threshold = 50)
}
\arguments{
\item{data}{Data frame with columns V1-V9 and class.}
\item{threshold}{Numeric. Classification threshold (default: 50).}
}
\value{
List of class "model_performance" containing confusion_matrix, accuracy,
sensitivity, specificity, and n_cases. Includes custom print method.
}
\description{
Evaluates prediction accuracy by comparing predicted classifications to
actual diagnoses. Returns confusion matrix and performance metrics.
}
\examples{
\dontrun{
data(biopsy)
performance <- evaluate_model_performance(biopsy)
print(performance)
}
}
\author{Sneh Patel (\email{prs23@usf.edu})}
