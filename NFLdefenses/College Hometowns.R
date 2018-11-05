#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(tidytext)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("NFL Player Colleges"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("player",
                   "College Attended",
                   choices = data_2018$X28)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))

## server stuff

Server <- function(input, output) {
  
  output$dotPlot <- renderPlot({
    
    
## Create My Graphic
    
  data_2018 %>%
      slice(2:11) %>%
      ggplot(aes(x = X4, y = X28)) + geom_point() + 
      labs(title = "NFL Draft 2018: Colleges attended of top 10 picks",
           x = "player name",
           y = "University Attended")
      
    
  })
  
}

## Run the App

shinyApp(ui = ui, server = server)
