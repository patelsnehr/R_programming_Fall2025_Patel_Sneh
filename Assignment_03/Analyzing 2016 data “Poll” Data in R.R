#setwd("C:/Users/Snehr/Desktop/FALL 2025/LIS 4370  R-Programming")

# Load libraries
library(ggplot2)
library(reshape2)

# Define vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine into data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect data structure and first rows
str(df_polls)
head(df_polls)

# Compute summary statistics separately for each poll
mean_abc <- mean(df_polls$ABC_poll)
median_abc <- median(df_polls$ABC_poll)
range_abc <- range(df_polls$ABC_poll)

mean_cbs <- mean(df_polls$CBS_poll)
median_cbs <- median(df_polls$CBS_poll)
range_cbs <- range(df_polls$CBS_poll)

print(paste("ABC Poll - Mean:", mean_abc, ", Median:", median_abc, ", Range:", paste(range_abc, collapse = " - ")))
print(paste("CBS Poll - Mean:", mean_cbs, ", Median:", median_cbs, ", Range:", paste(range_cbs, collapse = " - ")))

# Add difference column (CBS - ABC)
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# View updated data frame
print(df_polls)

# Reshape data for plotting
df_long <- melt(df_polls[, c("Name", "ABC_poll", "CBS_poll")], id.vars = "Name",
                variable.name = "Poll", value.name = "Percentage")

# Plot bar chart comparing ABC and CBS polls per candidate
p <- ggplot(df_long, aes(x = Name, y = Percentage, fill = Poll)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Poll Results by Candidate",
       y = "Poll Percentage",
       x = "Candidate") +
  theme_minimal()

# Save plot
ggsave("poll_results_bar_chart.png", plot = p, width = 8, height = 5)

# Print plot
print(p)

#Bloglink:https://medium.com/@prs23/assignment-3-assignment-3-analyzing-2016-data-poll-data-in-r-4dec44c29ae0
