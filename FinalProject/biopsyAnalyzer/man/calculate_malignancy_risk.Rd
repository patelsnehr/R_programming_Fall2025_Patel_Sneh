\name{calculate_malignancy_risk}
\alias{calculate_malignancy_risk}
\title{Calculate Malignancy Risk Score}
\usage{
calculate_malignancy_risk(clump_thickness, uniformity_cell_size,
                         uniformity_cell_shape, marginal_adhesion,
                         single_epithelial_size, bare_nuclei,
                         bland_chromatin, normal_nucleoli, mitoses)
}
\arguments{
\item{clump_thickness}{Numeric (1-10). Clump thickness score.}
\item{uniformity_cell_size}{Numeric (1-10). Cell size uniformity.}
\item{uniformity_cell_shape}{Numeric (1-10). Cell shape uniformity.}
\item{marginal_adhesion}{Numeric (1-10). Marginal adhesion score.}
\item{single_epithelial_size}{Numeric (1-10). Single epithelial cell size.}
\item{bare_nuclei}{Numeric (1-10) or NA. Bare nuclei score.}
\item{bland_chromatin}{Numeric (1-10). Bland chromatin score.}
\item{normal_nucleoli}{Numeric (1-10). Normal nucleoli score.}
\item{mitoses}{Numeric (1-10). Mitoses score.}
}
\value{
Numeric risk score (0-100)
}
\description{
Calculates weighted malignancy risk score based on 9 cellular characteristics.
Uses clinical importance weights: cell uniformity (15% each), bare nuclei (16%),
other features (6-12%).
}
\examples{
# Low risk (benign)
calculate_malignancy_risk(5, 1, 1, 1, 2, 1, 3, 1, 1)

# High risk (malignant)
calculate_malignancy_risk(10, 10, 10, 8, 7, 10, 9, 7, 1)

# With missing value
calculate_malignancy_risk(5, 4, 4, 5, 7, NA, 3, 2, 1)
}
\author{Sneh Patel (\email{prs23@usf.edu})}
