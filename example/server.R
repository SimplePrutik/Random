source("../functions/LCG.R")
source("../functions/LFSR.R")
source("../functions/uniform.R")

shinyServer(function(input, output) 
{
  
  output$distPlot <- renderPlot( {web_Graph(input$var, input$bins)  }, width = 500, height = 500)
}
)