library(shiny)

shinyUI( 
  pageWithSidebar(
    # Application title 
    headerPanel("Plotting Data on Cars"),
    sidebarPanel(
      textInput('plottitle', 'Plot Title:', value = "MPG vs. Weight"),
      helpText("Adjusts the title of the plot."),
      selectInput('xvariable', 'Choose an X Variable:', c("Weight", "Cylinders","Horsepower", "Transmission"), selected = "mtcars$wt"),
      helpText("Selects a different variable for plotting"),
      textInput('xtitle', 'X Label:', value = "Weight"),
      helpText("Adjusts the x-label of the plot."),
      checkboxInput('regchk',"Include Regression?:"),
      helpText("Include a regression line or not."),
      submitButton('Submit')
    ),
    mainPanel(
      p("Use the options to the left to adjust the chart's title and x-label."),
      p("Additionally, one can also adjust what variable is plotted on the x-axis,"),
      p("as well as a user-selectable switch to include the regression line."),
      plotOutput("newPlot")
    ) 
  )
)
