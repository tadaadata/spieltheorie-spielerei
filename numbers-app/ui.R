#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Spieltheoriespielerei"),

  # Sidebar with a slider input for number of bins
  wellPanel(
    fluidRow(
      column(width = 6,
             numericInput("number", "Zahl zwischen 0 und 10", value = NULL, min = 0, max = 10, width = "100%", step = 1)
             ),
      column(width = 6,
            textInput("id", "ID zur Zuordnung", value = NULL, width = "100%", placeholder = "Test01")
      )
    ),
      actionButton("submit", "OK", width = "100%")
  )
))
