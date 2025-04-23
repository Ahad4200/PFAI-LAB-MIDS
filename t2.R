library(ggplot2)
data(mtcars)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Relationship between Weight and MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon")