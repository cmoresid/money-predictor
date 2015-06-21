
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Salary Prediction"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        uiOutput('workclass_selection'),
        uiOutput('occupation_selection'),
        numericInput('hours', label = 'Hours in Work Week', min = 0, value = 40),
        uiOutput('education_selection'),
        uiOutput('country_selection'),
        uiOutput('race_selection'),
        uiOutput('marriage_selection'),
        uiOutput('relationship_selection'),
        numericInput('age', label = "Age", min = 16, value = 16),
        selectInput('gender', label = "Gender", multiple = FALSE, choices = c(" Male", " Female")),
        numericInput('capital_gain', label = "Capital Gains", min = 0, value = 0),
        numericInput('capital_loss', label = "Capital Losses", min = 0, value = 0),
        submitButton('Predict Salary Range')
    ),

    mainPanel(
      h3("Prediction Results"),
      textOutput("prediction_results"),
      br(),
      div("This is a very simple application that predicts your salary range. A random forest prediction model is used to make the salary prediction. The dataset used to train the model is from the ", a("UCI Adult dataset", href = "http://archive.ics.uci.edu/ml/datasets/Adult")),
      br(),
      div("This application was built for a class project -- don't take the results too seriously.")
    )
  )
))