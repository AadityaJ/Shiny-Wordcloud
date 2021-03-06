library(shiny)
fluidPage(
  # Application title
  titlePanel("Word Cloud in R"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      textInput("inText",  "Text input : ",value = "paste text here"),
      actionButton("update", "Run It"),
      hr(),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 100),
      tags$head(tags$style(type="text/css", "#inText {width: 270px}")) 
    ),

    # Show Word Cloud
    mainPanel(
      plotOutput("plot",width = "900px",height = "500px")
    )
  )
)