# ==============================================================================
# FUNCTION 1: Calculate Malignancy Risk Score (UNIQUE)
# ==============================================================================

#' Calculate Malignancy Risk Score
#'
#' @description
#' Calculates weighted malignancy risk score (0-100) based on 9 cellular characteristics.
#'
#' @param clump_thickness Numeric (1-10). Clump thickness score.
#' @param uniformity_cell_size Numeric (1-10). Cell size uniformity.
#' @param uniformity_cell_shape Numeric (1-10). Cell shape uniformity.
#' @param marginal_adhesion Numeric (1-10). Marginal adhesion score.
#' @param single_epithelial_size Numeric (1-10). Single epithelial cell size.
#' @param bare_nuclei Numeric (1-10) or NA. Bare nuclei score.
#' @param bland_chromatin Numeric (1-10). Bland chromatin score.
#' @param normal_nucleoli Numeric (1-10). Normal nucleoli score.
#' @param mitoses Numeric (1-10). Mitoses score.
#'
#' @return Numeric risk score (0-100)
#'
#' @examples
#' calculate_malignancy_risk(5, 1, 1, 1, 2, 1, 3, 1, 1)
#' calculate_malignancy_risk(10, 10, 10, 8, 7, 10, 9, 7, 1)
#'
#' @export
calculate_malignancy_risk <- function(clump_thickness, uniformity_cell_size,
                                      uniformity_cell_shape, marginal_adhesion,
                                      single_epithelial_size, bare_nuclei,
                                      bland_chromatin, normal_nucleoli, mitoses) {
  
  # Defensive Programming: Validate inputs
  args <- list(clump_thickness, uniformity_cell_size, uniformity_cell_shape,
               marginal_adhesion, single_epithelial_size, bare_nuclei,
               bland_chromatin, normal_nucleoli, mitoses)
  arg_names <- c("clump_thickness", "uniformity_cell_size", "uniformity_cell_shape",
                 "marginal_adhesion", "single_epithelial_size", "bare_nuclei",
                 "bland_chromatin", "normal_nucleoli", "mitoses")
  
  for (i in seq_along(args)) {
    if (!is.numeric(args[[i]])) {
      stop(paste(arg_names[i], "must be numeric"))
    }
    if (arg_names[i] != "bare_nuclei") {
      if (any(is.na(args[[i]]))) stop(paste(arg_names[i], "cannot be NA"))
      if (any(args[[i]] < 1 | args[[i]] > 10)) {
        stop(paste(arg_names[i], "must be between 1 and 10"))
      }
    } else if (any(!is.na(args[[i]]) & (args[[i]] < 1 | args[[i]] > 10))) {
      stop("bare_nuclei must be between 1 and 10 when not NA")
    }
  }
  
  # Weighted scoring algorithm (based on clinical importance)
  weights <- c(0.10, 0.15, 0.15, 0.08, 0.08, 0.16, 0.10, 0.12, 0.06)
  
  if (is.na(bare_nuclei)) {
    bare_nuclei <- 1
    warning("Missing bare_nuclei replaced with median (1)")
  }
  
  features <- c(clump_thickness, uniformity_cell_size, uniformity_cell_shape,
                marginal_adhesion, single_epithelial_size, bare_nuclei,
                bland_chromatin, normal_nucleoli, mitoses)
  
  weighted_score <- sum(features * weights)
  risk_score <- (weighted_score - 1) / 9 * 100
  
  return(round(risk_score, 2))
}


# ==============================================================================
# FUNCTION 2: Classify Tumor (UNIQUE)
# ==============================================================================

#' Classify Tumor as Benign or Malignant
#'
#' @description
#' Classifies tumor based on risk score threshold.
#'
#' @param risk_score Numeric (0-100). Risk score from calculate_malignancy_risk().
#' @param threshold Numeric. Classification threshold (default: 50).
#'
#' @return Character: "benign" or "malignant"
#'
#' @examples
#' classify_tumor(25)
#' classify_tumor(75)
#'
#' @export
classify_tumor <- function(risk_score, threshold = 50) {
  # Defensive Programming
  if (!is.numeric(risk_score)) stop("risk_score must be numeric")
  if (any(risk_score < 0 | risk_score > 100, na.rm = TRUE)) {
    stop("risk_score must be between 0 and 100")
  }
  if (!is.numeric(threshold) || length(threshold) != 1) {
    stop("threshold must be a single numeric value")
  }
  if (threshold < 0 || threshold > 100) {
    stop("threshold must be between 0 and 100")
  }
  
  return(ifelse(risk_score >= threshold, "malignant", "benign"))
}


# ==============================================================================
# FUNCTION 3: Biopsy Assessment S3 Object (UNIQUE)
# ==============================================================================

#' Create Biopsy Assessment Object
#'
#' @description
#' Creates comprehensive S3 assessment object with risk scoring and classification.
#'
#' @param ID Character/numeric. Patient identifier.
#' @param V1 to V9 Numeric (1-10). Nine cellular characteristics.
#' @param actual_class Character. Optional actual diagnosis: "benign" or "malignant".
#'
#' @return S3 object of class "biopsy_assessment"
#'
#' @examples
#' assessment <- biopsy_assessment(
#'   ID = "12345", V1 = 5, V2 = 1, V3 = 1, V4 = 1, V5 = 2,
#'   V6 = 1, V7 = 3, V8 = 1, V9 = 1, actual_class = "benign"
#' )
#' print(assessment)
#'
#' @export
biopsy_assessment <- function(ID, V1, V2, V3, V4, V5, V6, V7, V8, V9,
                              actual_class = NULL) {
  
  # Validate inputs
  if (any(sapply(list(V1, V2, V3, V4, V5, V6, V7, V8, V9), function(x) !is.numeric(x)))) {
    stop("All V1-V9 must be numeric")
  }
  
  # Calculate risk
  risk_score <- calculate_malignancy_risk(V1, V2, V3, V4, V5, V6, V7, V8, V9)
  predicted_class <- classify_tumor(risk_score)
  risk_level <- if (risk_score < 33) "Low" else if (risk_score < 67) "Moderate" else "High"
  
  # Create S3 object
  result <- list(
    patient_id = as.character(ID),
    features = list(V1=V1, V2=V2, V3=V3, V4=V4, V5=V5, V6=V6, V7=V7, V8=V8, V9=V9),
    risk_score = risk_score,
    predicted_class = predicted_class,
    risk_level = risk_level,
    actual_class = actual_class
  )
  
  class(result) <- "biopsy_assessment"
  return(result)
}

#' @export
print.biopsy_assessment <- function(x, ...) {
  cat("=== Biopsy Assessment ===\n")
  cat("ID:", x$patient_id, "\n")
  cat("Risk Score:", x$risk_score, "/100\n")
  cat("Risk Level:", x$risk_level, "\n")
  cat("Predicted:", toupper(x$predicted_class), "\n")
  if (!is.null(x$actual_class)) {
    cat("Actual:", toupper(x$actual_class), "\n")
    cat(ifelse(x$predicted_class == x$actual_class, "✓ MATCH\n", "✗ MISMATCH\n"))
  }
  invisible(x)
}


# ==============================================================================
# FUNCTION 4: Analyze Feature Importance (UNIQUE)
# ==============================================================================

#' Analyze Feature Importance
#'
#' @description
#' Calculates which cellular characteristics best distinguish benign from malignant.
#'
#' @param data Data frame with columns V1-V9 and class.
#'
#' @return Data frame with feature importance rankings
#'
#' @examples
#' \dontrun{
#' data(biopsy)
#' importance <- analyze_feature_importance(biopsy)
#' print(importance)
#' }
#'
#' @importFrom dplyr group_by summarize
#' @export
analyze_feature_importance <- function(data) {
  # Defensive Programming
  if (!is.data.frame(data)) stop("data must be a data frame")
  
  required_cols <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "class")
  if (!all(required_cols %in% names(data))) {
    stop("data must contain V1-V9 and class columns")
  }
  
  feature_names <- c("Clump Thickness", "Cell Size Uniformity", "Cell Shape Uniformity",
                    "Marginal Adhesion", "Single Epithelial Size", "Bare Nuclei",
                    "Bland Chromatin", "Normal Nucleoli", "Mitoses")
  
  results <- data.frame(
    Feature = feature_names,
    Benign_Mean = numeric(9),
    Malignant_Mean = numeric(9),
    Difference = numeric(9),
    Importance_Score = numeric(9)
  )
  
  for (i in 1:9) {
    feat_name <- paste0("V", i)
    benign_mean <- mean(data[data$class == "benign", feat_name], na.rm = TRUE)
    malignant_mean <- mean(data[data$class == "malignant", feat_name], na.rm = TRUE)
    
    results$Benign_Mean[i] <- round(benign_mean, 2)
    results$Malignant_Mean[i] <- round(malignant_mean, 2)
    results$Difference[i] <- round(abs(malignant_mean - benign_mean), 2)
  }
  
  # Normalize to 0-100 scale
  max_diff <- max(results$Difference)
  results$Importance_Score <- round((results$Difference / max_diff) * 100, 2)
  
  # Sort by importance
  results <- results[order(-results$Importance_Score), ]
  rownames(results) <- NULL
  
  return(results)
}


# ==============================================================================
# FUNCTION 5: Evaluate Model Performance (UNIQUE)
# ==============================================================================

#' Evaluate Model Performance
#'
#' @description
#' Evaluates prediction accuracy with confusion matrix and performance metrics.
#'
#' @param data Data frame with V1-V9 and class columns.
#' @param threshold Numeric. Classification threshold (default: 50).
#'
#' @return List with confusion matrix, accuracy, sensitivity, specificity
#'
#' @examples
#' \dontrun{
#' data(biopsy)
#' performance <- evaluate_model_performance(biopsy)
#' print(performance)
#' }
#'
#' @export
evaluate_model_performance <- function(data, threshold = 50) {
  # Defensive Programming
  if (!is.data.frame(data)) stop("data must be a data frame")
  
  required_cols <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "class")
  if (!all(required_cols %in% names(data))) {
    stop("data must contain V1-V9 and class columns")
  }
  
  # Calculate risk scores
  complete_data <- data[complete.cases(data[, c("V1", "V2", "V3", "V4", "V5", 
                                                 "V7", "V8", "V9", "class")]), ]
  
  risk_scores <- sapply(1:nrow(complete_data), function(i) {
    calculate_malignancy_risk(
      complete_data$V1[i], complete_data$V2[i], complete_data$V3[i],
      complete_data$V4[i], complete_data$V5[i], complete_data$V6[i],
      complete_data$V7[i], complete_data$V8[i], complete_data$V9[i]
    )
  })
  
  predictions <- classify_tumor(risk_scores, threshold)
  actual <- complete_data$class
  
  # Confusion matrix
  confusion <- table(Predicted = predictions, Actual = actual)
  
  TP <- confusion["malignant", "malignant"]
  TN <- confusion["benign", "benign"]
  FP <- confusion["malignant", "benign"]
  FN <- confusion["benign", "malignant"]
  
  # Calculate metrics
  result <- list(
    confusion_matrix = confusion,
    accuracy = round((TP + TN) / sum(confusion), 4),
    sensitivity = round(TP / (TP + FN), 4),
    specificity = round(TN / (TN + FP), 4),
    n_cases = nrow(complete_data)
  )
  
  class(result) <- "model_performance"
  return(result)
}

#' @export
print.model_performance <- function(x, ...) {
  cat("=== Model Performance ===\n")
  cat("Cases:", x$n_cases, "\n\n")
  cat("Confusion Matrix:\n")
  print(x$confusion_matrix)
  cat("\nAccuracy:   ", x$accuracy * 100, "%\n")
  cat("Sensitivity:", x$sensitivity * 100, "%\n")
  cat("Specificity:", x$specificity * 100, "%\n")
  invisible(x)
}
