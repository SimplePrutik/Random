source("../functions/LCG.R")
source("../functions/LFSR.R")
source("../functions/uniform.R")
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should
  #     re-execute automatically when inputs change
  #  2) Its output type is a plot

  output$distPlot <- renderPlot({
    web_LCG(input$bins)
  }, width = 500, height = 500)
})