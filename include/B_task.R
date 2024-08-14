library(ggplot2)

# Load data
data <- read.csv("//usr/local/airflow/files/users.csv", header=TRUE)

# Barplot
p <- ggplot(data, aes(x = as.factor(gender), fill = gender)) +
  geom_bar(stat = "count", position = "stack") +
  labs(x = "Gender",
       y = "Count")

png("/usr/local/airflow/files/counts_by_gender.png")
print(p)
dev.off()