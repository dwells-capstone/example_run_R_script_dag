library(ggplot2)

# Load data
data <- read.csv("/example_run_R_script_dag/include/users.csv", header=TRUE)

# Barplot
p <- ggplot(data, aes(x = as.factor(dob.age))) +
  geom_bar(stat = "count", position = "stack", fill = "#FF6666") +
  labs(x = "Age",
       y = "Count")

png("/example_run_R_script_dag/include/counts_by_age.png", width = 800, height = 400)
print(p)
dev.off()