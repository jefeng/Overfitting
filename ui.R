library(shiny)
library(shinythemes)
fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("Overfitting"),
  fluidRow(
    column(3, wellPanel(
      sliderInput("n", "Number of Samples:", min = 5, max = 1000, value = 5 ,
                  step = 10),
      sliderInput("p", "True Population Correlation:", min = -1, max = 1 , value = 0,
                  step = 0.01),
      sliderInput("k", "The Number of Variables:", min = 1, max = 100 , value = 3 ,
                  step = 1),
      actionButton("goButton", "Click here to Validate")
    )),
    column(6,offset=1, align="center", 
           plotOutput("plot1", width = 640, height = 480) 
    ),
    div(style = "position:absolute;bottom: 4em;left:42em;",
        htmlOutput("text"))
  )
)