# biopsyAnalyzer

**Author:** Sneh Patel  
**Email:** prs23@usf.edu  
**Course:** R Programming with Dr. Alon Friedman, University of South Florida  
**Date:** December 1, 2025

## Overview

R package for analyzing breast cancer biopsy data from the Wisconsin Breast Cancer Database.

## Dataset

- **Source:** University of Wisconsin Hospitals, Dr. William H. Wolberg
- **Cases:** 699 patients
- **Features:** 9 cellular characteristics (scored 1-10)
- **Outcome:** Benign (458) or Malignant (241)

## 5 Unique Functions

1. **`calculate_malignancy_risk()`** - Weighted risk scoring algorithm (0-100)
2. **`classify_tumor()`** - Binary classification (benign vs malignant)
3. **`biopsy_assessment()`** - S3 assessment object with print method
4. **`analyze_feature_importance()`** - Feature ranking analysis
5. **`evaluate_model_performance()`** - Model evaluation with metrics

## S3 Methods

- `print.biopsy_assessment()`
- `print.model_performance()`

## Installation

```r
devtools::install_github("YourUsername/biopsyAnalyzer")
```

## Quick Start

```r
library(biopsyAnalyzer)

# Load data
data(biopsy)

# Calculate risk for a single case
risk <- calculate_malignancy_risk(5, 4, 4, 5, 7, 1, 3, 2, 1)
print(risk)

# Create assessment object
assessment <- biopsy_assessment(
  ID = biopsy$ID[1],
  V1 = biopsy$V1[1], V2 = biopsy$V2[1], V3 = biopsy$V3[1],
  V4 = biopsy$V4[1], V5 = biopsy$V5[1], V6 = biopsy$V6[1],
  V7 = biopsy$V7[1], V8 = biopsy$V8[1], V9 = biopsy$V9[1],
  actual_class = biopsy$class[1]
)
print(assessment)

# Analyze feature importance
importance <- analyze_feature_importance(biopsy)
print(importance)

# Evaluate performance
performance <- evaluate_model_performance(biopsy)
print(performance)
```

## Package Metadata

- **License:** MIT
- **Dependencies:** ggplot2, dplyr
- **R Version:** >= 4.0.0

## References

Wolberg, W. H., & Mangasarian, O. L. (1990). Multisurface method of pattern separation for medical diagnosis applied to breast cytology. *PNAS*, 87, 9193-9196.
