source("../functions/LCG.R")
source("../functions/LFSR.R")
source("../functions/uniform.R")
library(shiny)
shinyApp(ui = fluidPage
    (
        titlePanel("Monte-Carlo"),
        sidebarLayout
        ( 
            sidebarPanel
            (
                sliderInput("bins",
                    "Amount of points",
                    min = 100,
                    max = 10000,
                    value = 1),
                selectInput("var",
                    label = "Choose generator",
                    choices = list("Mersenne-Twister", "LCG", "LFSR"),
                    selected = "Mersenne-Twister", selectize=TRUE)
            ),
            mainPanel
            (
                plotOutput("distPlot") 
            )
        )
        
    ), server = function(input, output) 
{
  
  output$distPlot <- renderPlot( {web_Graph(input$var, input$bins)  }, width = 500, height = 500)
}, options = list(launch.browser = TRUE))