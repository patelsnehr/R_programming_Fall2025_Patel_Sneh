# Load and explore built-in dataset

data("mtcars")

cat("First few rows:\n")

print(head(mtcars))

cat("\nStructure:\n")

str(mtcars)

# Apply generic functions

cat("\nSummary statistics:\n")

print(summary(mtcars))

cat("\nPlotting mpg vs hp...\n")

png(filename = "mpgvhp.png", width = 800, height = 600)

plot(mtcars$mpg, mtcars$hp, main = "MPG vs HP", xlab = "Miles/Gallon", ylab = "Horsepower")

dev.off()

# S3 object and custom print method

s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)

class(s3_obj) <- "student_s3"

print.student_s3 <- function(x, ...) {
  cat("S3 Student Record\n")
  cat(" Name:", x$name, "\n Age:", x$age, "\n GPA:", x$GPA, "\n")
}

cat("\nS3 object print:\n")

print(s3_obj)

# S4 class, object, and custom show method

setClass("student_s4", slots = c(name = "character", age = "numeric", GPA = "numeric"))

setMethod("show", "student_s4", function(object) {
  cat("S4 Student Record\n")
  cat(" Name:", object@name, "\n Age:", object@age, "\n GPA:", object@GPA, "\n")
})

s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)
cat("\nS4 object show:\n")
print(s4_obj)
 