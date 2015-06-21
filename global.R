library(dplyr)
library(caret)

set.seed(100)
load('data/model.rda')

workclass <- train %>% select(workclass) %>% distinct() %>% arrange()
workclass <- levels(workclass$workclass)

education <- train %>% select(education) %>% distinct() %>% arrange()
education <- levels(education$education)

marriage <- train %>% select(marital.status) %>% distinct() %>% arrange()
marriage <- levels(marriage$marital.status)

occupation <- train %>% select(occupation) %>% distinct() %>% arrange()
occupation <- levels(occupation$occupation)

relationship <- train %>% select(relationship) %>% distinct() %>% arrange()
relationship <- levels(relationship$relationship)

race <- train %>% select(race) %>% distinct() %>% arrange()
race <- levels(race$race)

country <- train %>% select(country) %>% distinct() %>% arrange()
country <- levels(country$country)
