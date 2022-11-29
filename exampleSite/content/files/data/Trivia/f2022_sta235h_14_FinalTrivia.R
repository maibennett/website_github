################################################################################
### Title: "Week 14 - Final Trivia"
### Course: STA 235H
### Semester: Fall 2022
### Professor: Magdalena Bennett
################################################################################

# Clears memory
rm(list = ls())
# Clears console
cat("\014")

### Load libraries
library(tidyverse)
library(caret)
library(rpart)
library(rattle)
library(rsample)
library(ranger)

candy <- read.csv("C:/Users/mc72574/Dropbox/UT/Teaching/2022Fall_STA235H/Trivia/data/candy.csv")

# We will use a seed of 100 and a cross-validation of 10-fold.
set.seed(100)

candy <- candy %>% select(-competitorname)

split <- initial_split(candy, prop = 0.9, strata = "winpercent")
train.data <- training(split)
test.data <- testing(split)

set.seed(100)

# Single decision tree

dt <- train(winpercent ~ ., data = train.data,
            method = "rpart",
            tuneGrid = expand.grid(cp = seq(0,0.1,length = 100)),
            trControl = trainControl(method = "cv", number = 10))

fancyRpartPlot(dt$finalModel, caption = "Decision Tree for Candy")

# Random forest

tuneGrid <- expand.grid(
  mtry = #COMPLETE,
  splitrule = "variance",
  min.node.size = 5
)

set.seed(100)

rf <- #COMPLETE
