library(shiny)


fluidPage(
  
 
  titlePanel("Old Faithful Geyser Data"),

  

  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    

    actionButton("do", 
                 "Click Me"),
    
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

sliderInput("slider2", label = h3("Slider Range"), min = 0, 
            max = 100, value = c(40, 60))


