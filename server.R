
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  output$workclass_selection <- renderUI({
      selectInput('workclass_selection', 
                  label = "Occupation Sector", 
                  multiple = FALSE, 
                  choices = workclass)
  })
  
  output$education_selection <- renderUI({
      selectInput('education_selection', 
                  label = "Education Level", 
                  multiple = FALSE, 
                  choices = education)
  })
  
  output$marriage_selection <- renderUI({
      selectInput('marriage_selection', 
                  label = "Marital Status", 
                  multiple = FALSE, 
                  choices = marriage)
  })
  
  output$occupation_selection <- renderUI({
      selectInput('occupation_selection', 
                  label = "Occupation", 
                  multiple = FALSE, 
                  choices = occupation)
  })
  
  output$relationship_selection <- renderUI({
      selectInput('relationship_selection', 
                  label = "Relationship Status", 
                  multiple = FALSE, 
                  choices = relationship)
  })
  
  output$race_selection <- renderUI({
      selectInput('race_selection', 
                  label = "Race", 
                  multiple = FALSE, 
                  choices = race)
  })
  
  output$country_selection <- renderUI({
      selectInput('country_selection', 
                  label = "Country", 
                  multiple = FALSE, 
                  choices = country)
  })
  
  output$prediction_results <- renderText({
      age <- c(input$age)
      hours <- c(input$hours)
      workclass <- c(input$workclass_selection)
      fnlwgt <- c(mean(train$fnlwgt))
      education <- c(input$education_selection)
      marital.status <- c(input$marriage_selection)
      occupation <- c(input$occupation_selection)
      relationship <- c(input$relationship_selection)
      race <- c(input$race_selection)
      sex <- c(input$gender)
      capital.gain <- c(input$capital_gain)
      capital.loss <- c(input$capital_loss)
      country <- c(input$country_selection)
      
      if (length(education) == 0 ||
              length(workclass) == 0 ||
              length(education) == 0 ||
              length(marital.status) == 0 ||
              length(occupation) == 0 ||
              length(relationship) == 0 ||
              length(race) == 0 ||
              length(sex) == 0 ||
              length(capital.gain) == 0 ||
              length(capital.loss) == 0 ||
              length(country) == 0) {
          
          return("Please fill out all fields.")
      }
      
      pred_input <- data.frame(
            age, workclass, fnlwgt,
            education, marital.status,
            occupation, relationship,
            race, sex, capital.gain,
            capital.loss, country, hours
          )
      
      results <- predict(model, pred_input)
      
      if (results == 1) {
          "Less than or equal $50,000 / year"
      }
      else {
          "Greater than $50,000 / year"
      }
  })
})
