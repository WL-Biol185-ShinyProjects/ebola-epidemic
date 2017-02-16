library(shiny)

<<<<<<< HEAD
# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
=======

fluidPage(
  
 
  titlePanel("Old Faithful Geyser Data"),
  
  
>>>>>>> 473d93ae9d60888bdae37bd21b6631a3632e0754
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
<<<<<<< HEAD
    # Show a plot of the generated distribution
=======
   
>>>>>>> 473d93ae9d60888bdae37bd21b6631a3632e0754
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
<<<<<<< HEAD
sliderInput("slider2", label = h3("Slider Range"), min = 0, 
            max = 100, value = c(40, 60))
=======


>>>>>>> 473d93ae9d60888bdae37bd21b6631a3632e0754
