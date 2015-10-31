source("LCG.R")
source("LFSR.R")
source("Mersenne_Twister.R")

if (!("shiny" %in% rownames(installed.packages())))
    install.packages("shiny", repos = "https://cran.gis-lab.info/")

library(shiny)

shinyApp(
        ui = fluidPage
        (
            titlePanel("Monte-Carlo"),
            sidebarLayout
            ( 
                sidebarPanel
                (
                    sliderInput("bins",
                        "Amount of points",
                        min = 1000,
                        max = 100000,
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
            
        ),
        server = function(input, output) 
        {
            output$distPlot <- renderPlot( {web_Graph(input$var, input$bins)  }, 
                                            width = 500, 
                                            height = 500)
        },
        options = list(launch.browser = TRUE)
)

