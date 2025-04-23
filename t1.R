library(dplyr)
data(mtcars)

result <- mtcars %>%
  filter(mpg > 20) %>%
  arrange(desc(hp))

print(result)