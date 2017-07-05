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
      bsPopover("n", "", "Number of Observations", place="right",options = list(container = "body")),
      
      sliderInput("p", "True Population Correlation:", min = -1, max = 1 , value = 0,
                  step = 0.01),
      
      bsPopover("p", "", "Move the slider to change true population correlation", place="right",options = list(container = "body")),
      
      sliderInput("k", "The Number of Variables:", min = 1, max = 100 , value = 3 ,
                  step = 1),
      bsPopover("k", "", "Move the slider to change the number of variables in the model", place="right",options = list(container = "body")),
      
      actionButton("plot", "Click here first to Plot"), 
      bsPopover("plot", "", "There will be a density curve (black line) and a scatterplot (with a red regression line) shown once you click this button. The density plot is the residual between Y and estimated Y with the best picked X (The one that has the strongest correlation with Y) in the model and the scatterplot is plotting the replationship between the best picked X and Y", place="right",options = list(container = "body")),
      
      br(),
      br(),
      
      actionButton("validate", "Click here later to Validate"))),
      bsPopover("validate", "", "There will be a new density curve (blue line) shown once you click this button. This new blue curve is the residual between Y and estimated Y with a randomly picked X in the model", place="right",options = list(container = "body")),
    
    
      
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
      tableOutput("choose"),
      bsPopover("choose", "", "Compared the sample best correlation and randomly chosen correlation (In absolute value terms)", place="right",options = list(container = "body")))
    
      
    
      
  )
)