library(shiny)

# Define UI for dataset viewer application
shinyUI(
  navbarPage("Son's height prediction",
  
    tabPanel("Pediction",
      wellPanel(
        sliderInput("father.height", "Father's height", min = 59.5, max = 75, value = 65, step = .2),
        h3(textOutput("father.height.cm")),
        actionButton("goButton", "Go!")
      ),
      mainPanel(
        h3('Result of prediction'),
        h3(textOutput("son.height.in")),
        h3(textOutput("son.height.cm")),
        h3("Plot"),
        plotOutput("scatterPlot", height = 400)
      )
    ),
    tabPanel("Documentation",
      mainPanel(
        includeMarkdown("help.Rmd")
      )
    )
  )
)