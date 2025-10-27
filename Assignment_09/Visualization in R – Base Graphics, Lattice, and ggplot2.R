# Load dataset
data("iris", package = "datasets")
head(iris)

# Base R Graphics
# 1. Scatter plot: Sepal.Length vs Sepal.Width
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Base R: Sepal Length vs Width",
     xlab = "Sepal Length",
     ylab = "Sepal Width",
     col = iris$Species,
     pch = 19)

# 2. Histogram: Distribution of Petal.Length
hist(iris$Petal.Length,
     main = "Base R: Distribution of Petal Length",
     xlab = "Petal Length",
     col = "lightblue",
     border = "black")

# Lattice Graphics
library(lattice)

# 1. Conditional scatter plot: Sepal.Length vs Sepal.Width by Species
xyplot(Sepal.Width ~ Sepal.Length | Species,
       data = iris,
       main = "Lattice: Sepal Width vs Length by Species",
       layout = c(3,1),
       pch = 19,
       col = "blue")

# 2. Box plot: Petal.Length by Species
bwplot(Species ~ Petal.Length,
       data = iris,
       main = "Lattice: Petal Length by Species",
       col = "orange")

# ggplot2 Graphics
library(ggplot2)

# 1. Scatter plot with linear smoothing by Species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "ggplot2: Sepal Width vs Length with Regression by Species")

# 2. Faceted histogram of Petal.Length by Species
ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 0.3, fill = "skyblue", color = "black") +
  facet_wrap(~ Species) +
  labs(title = "ggplot2: Petal Length Distribution by Species")

