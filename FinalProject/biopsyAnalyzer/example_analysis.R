# ==============================================================================
# BIOPSY ANALYZER - EXAMPLE ANALYSIS
# Author: Sneh Patel
# Email: prs23@usf.edu
# Course: Dr. Alon Friedman, University of South Florida
# ==============================================================================

# NOTE: Make sure package is loaded first with:
# devtools::load_all("path/to/biopsyAnalyzer")
# OR if installed: library(biopsyAnalyzer)

cat("Checking if package is loaded...\n")
if (!exists("calculate_malignancy_risk")) {
  stop("Package not loaded! Run: devtools::load_all('path/to/biopsyAnalyzer') first")
}

# Load data
data(biopsy)

cat("=== Dataset Overview ===\n")
cat("Cases:", nrow(biopsy), "\n")
cat("Benign:", sum(biopsy$class == "benign"), "\n")
cat("Malignant:", sum(biopsy$class == "malignant"), "\n\n")

# Example 1: Calculate risk for single case
cat("=== Example 1: Risk Calculation ===\n")
risk <- calculate_malignancy_risk(5, 4, 4, 5, 7, 1, 3, 2, 1)
cat("Risk Score:", risk, "\n")
cat("Classification:", classify_tumor(risk), "\n\n")

# Example 2: Create assessment object
cat("=== Example 2: Biopsy Assessment ===\n")
assessment <- biopsy_assessment(
  ID = biopsy$ID[1],
  V1 = biopsy$V1[1], V2 = biopsy$V2[1], V3 = biopsy$V3[1],
  V4 = biopsy$V4[1], V5 = biopsy$V5[1], V6 = biopsy$V6[1],
  V7 = biopsy$V7[1], V8 = biopsy$V8[1], V9 = biopsy$V9[1],
  actual_class = biopsy$class[1]
)
print(assessment)

# Example 3: Feature importance
cat("\n=== Example 3: Feature Importance ===\n")
importance <- analyze_feature_importance(biopsy)
print(importance)

# Example 4: Model performance
cat("\n=== Example 4: Model Performance ===\n")
performance <- evaluate_model_performance(biopsy)
print(performance)

cat("\n=== Analysis Complete ===\n")
