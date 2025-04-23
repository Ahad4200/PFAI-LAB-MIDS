library(caret)
data(mtcars)

# Split data into training and testing sets (80-20 split)
set.seed(123)
trainIndex <- createDataPartition(mtcars$mpg, p = 0.8, list = FALSE)
trainData <- mtcars[trainIndex, ]
testData <- mtcars[-trainIndex, ]

# Preprocess: scale the data
preProc <- preProcess(trainData, method = c("center", "scale"))
trainScaled <- predict(preProc, trainData)
testScaled <- predict(preProc, testData)

# Train linear regression model
model <- train(mpg ~ ., data = trainScaled, method = "lm")

# Predict on test set
predictions <- predict(model, newdata = testScaled)

# Evaluate with RMSE
rmse <- sqrt(mean((predictions - testScaled$mpg)^2))
print(paste("RMSE:", rmse))