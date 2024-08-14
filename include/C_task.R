library(ggplot2)

# Load data
data <- read.csv("/usr/local/airflow/files/users.csv", header=TRUE)

# Barplot
p <- ggplot(data, aes(x = as.factor(dob.age))) +
  geom_bar(stat = "count", position = "stack", fill = "#FF6666") +
  labs(x = "Age",
       y = "Count")

png("/usr/local/airflow/files/counts_by_age.png", width = 800, height = 400)
print(p)
dev.off()