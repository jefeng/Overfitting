library(shiny)
library(shinythemes)
fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("Overfitting"),
  tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #1C2C5B}")),
  tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: #1C2C5B}")),
  tags$style(HTML(".js-irs-2 .irs-single, .js-irs-2 .irs-bar-edge, .js-irs-2 .irs-bar {background: #1C2C5B}")),
  fluidRow(
    column(3, wellPanel(
      sliderInput("n", "Sample Size:", min = 1, max = 1000, value = 5 ,
                  step = 1),
      sliderInput("p", "True Population Correlation:", min = -1, max = 1 , value = 0,
                  step = 0.01),
      sliderInput("k", "The Number of Variables:", min = 1, max = 100 , value = 3 ,
                  step = 1),
      actionButton("plot", "Click here first to Plot"),
      br(),
      br(),
      
      actionButton("validate", "Click here later to Validate"))),
    
      
    absolutePanel(
      id = "controls", class = "myClass", fixed = FALSE,
      draggable = FALSE, top = 40, left = "auto", right = 510, bottom = "auto",
      width = 520, height = "auto",
      plotOutput("plot")),
    
      absolutePanel(
      id = "controls", class = "myClass", fixed = FALSE,
      draggable = FALSE, top = 40, left = "auto", right = -3, bottom = "auto",
      width = 500, height = "auto",
      plotOutput("scatter")),
    
      absolutePanel(
      id = "controls", class = "myClass", fixed = FALSE,
      draggable = FALSE, top = 460, left = "auto", right = 488, bottom = "auto",
      width = 500, height = "auto",
      tableOutput("choose")),
    
      conditionalPanel("input.validate != 0",
      div(style = "position:absolute;bottom: 4em;left:26em;",
        htmlOutput("text")))
  )
)