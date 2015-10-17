shinyUI(
    fluidPage
    (
        titlePanel("Monte-Carlo"),
        sidebarLayout
        ( 
            sidebarPanel
            (
                sliderInput("bins",
                    "Amount of points",
                    min = 100,
                    max = 5000,
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
        
    )

)