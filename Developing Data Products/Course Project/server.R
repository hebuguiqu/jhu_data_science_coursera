library(shiny)

data(mtcars)

shinyServer( 
  function(input, output) {
    xvarInput <- reactive({
      switch(input$xvariable,
             "Weight"=mtcars$wt,
             "Cylinders"=mtcars$cyl,
             "Horsepower"=mtcars$hp,
             "Transmission"=mtcars$am)
    })
    output$newPlot <- renderPlot({
      plot(xvarInput(), mtcars$mpg, main = input$plottitle, xlab = input$xtitle, ylab = "MPG")
      if(input$regchk) {
        abline(lm(mtcars$mpg ~ xvarInput()))
      }
      }) 
  }
)
