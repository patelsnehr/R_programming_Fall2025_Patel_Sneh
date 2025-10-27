# Set working directory to your assignment folder
#setwd("C:/Users/Snehr/Desktop/FALL 2025/LIS 4370 R-Programming/Assignment_08")

# Read dataset as CSV to correctly parse column headers
student6 <- read.csv("Assignment 6 Dataset.txt", stringsAsFactors = FALSE)

# Confirm columns are correctly read
print(colnames(student6))  # Should print "Name" "Age" "Sex" "Grade"

# Load plyr for data aggregation
library(plyr)

# Compute mean Grade grouped by Sex
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# Write grouped mean grades to tab-separated text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

# Filter rows where Name contains "i" or "I"
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# Write filtered names only to CSV without quotes or row names
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

# Write full filtered data frame to CSV
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)

#Confirming Data Was Saved
file.exists("gender_mean.txt")       
file.exists("i_students.csv")        
file.exists("i_students_full.csv")   
