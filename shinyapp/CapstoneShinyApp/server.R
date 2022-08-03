#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

source("helpers.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$prediction <- renderText({
      paste(input$textInput,"<font size=30 color=\"#53B993\"><b>", predict(input$textInput), "</b></font>")
    })
 
    
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })
    
    output$Ggplot <- renderPlotly({
      
      d <- diamonds[sample(nrow(diamonds), input$samplesize), ]
      
      fig <- ggplotly(
        ggplot(d, aes(x = carat, y = price, color = cut)) +
          geom_point(color = "#CC0000", shape = 1, size = 1) +
          geom_smooth(method = 'lm') 
      )
      
      fig
      
    })
    

})
