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
data <- read_rds("2018data")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("NFL Player Colleges"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("College",
                   label = "College Attended",
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
  
  output$distPlot <- renderPlot({
    
    
## Create My Graphic
    
  data_2018 %>%
      count(`College/Univ`) %>%
      arrange(desc(n)) %>%
      slice(1:10) %>%
      ggplot(aes(x = `College/Univ`, y = n)) + geom_bar() + 
      labs(title = "NFL Draft 2018: Top 10 Colleges Represented",
           x = "College",
           y = "Number of Players Attended")
      
    
  })
  
}

## Run the App

shinyApp(ui = ui, server = server)
