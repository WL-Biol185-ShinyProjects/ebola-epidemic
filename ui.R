library(shiny)
library(shinydashboard)



dashboardPage(skin = "green",
  
  
  dashboardHeader(title = "Basic dashboard"),
  
  
  
  dashboardSidebar(width = 120,
    
    
    sidebarMenu(
   
     menuItem("Intro", tabName = "Introduction"),
    
     menuItem("Total Deaths", tabName = "dashboard"),
    
     menuItem("Total Cases", tabName = "Cases"),
     
     menuItem("Country", tabName = "Country"),
     
     menuItem("Socio-Economic", tabName = "Socio"),
     
     menuItem("Sources", tabName = "Source")
     
     )
     
     ),
  
  
  
  
  
  
  
  dashboardBody(
    
    
    
    
    

    tabItems(
      
      tabItem("Introduction",
              
              fluidRow( 
                box(p("Ebola is....."))
              )),
  #############################     
      
      tabItem("dashboard",
              
              fluidRow(
                 box(background = "black", leafletOutput("Map", height = 400)),
                 
                 
                 
                 box(title = "Controls", background = "black", status = "primary",
                     
                     sliderInput("Dateslider", "Looping Animation:", 
                                 min(datafordeath$NewDate), 
                                 max(datafordeath$NewDate), 
                                 min(datafordeath$NewDate),
                                 step = 1, 
                                 animate=
                                   animationOptions(interval=75, loop=TRUE)),
                 
                 
                     
                     
                     sliderInput("Localitegraphslider", "Graph Slider",
                             min = min(datafordeath$NewDate), 
                             max = max(datafordeath$NewDate),
                             value = min(datafordeath$NewDate)))
                   
                
              
                 ),
               
               
              fluidRow(
                 plotOutput("death_graph", height = "400", width = "1000"))),
    
    
####################################    

      tabItem("Cases",
              
              fluidRow(
                box(background = "black", leafletOutput("casesMap", height = 250)),
                
                box(
                  title = "Controls", background = "black", status = "primary",
                 
                  
                  sliderInput("casesslider", "Looping Animation:", 
                              min(c_w_cases$NewDate), 
                              max(c_w_cases$NewDate), 
                              min(c_w_cases$NewDate),
                              step = 1, 
                              animate=
                                animationOptions(interval=75, loop=TRUE)),
                  
                  sliderInput("casesgraphslider", "Graph Slider",
                              
                              min = min(c_w_cases$NewDate), 
                              max = max(c_w_cases$NewDate), 
                              value = min(c_w_cases$NewDate))
                  
                  )),
            
              
              
              
              
              
              fluidRow(
                plotOutput("cases_graph", height = "400", width = "1000"))),
      
      
#####################################################################      
    
      tabItem("Country",
            
              
              fluidRow(
               box(title = "Total Deaths", width = 12,
              plotOutput("country_graph", height = "400", width = "1000"))),
              
              
              fluidRow(
                box(title = "Total Cases", width = 12,
                plotOutput("casescountrygraph", height = "400", width = "1000")))
              
              
              
              ),
      
              
              

#################################################################################




              
      tabItem("Socio",        
              
                        
                
              fluidRow(
             
                  
              box(status = "primary", background = "black", selectInput("selectX", label = h3("Select box for X"), 
                              choices = colnames(EbolaGDP)))), 
                              
              
              fluidRow(   
                      
              box(status = "primary", background = "black", selectInput("selectY", label = h3("Select box for Y"),
                              choices = colnames(EbolaGDP)))),
              
              
              
              
              fluidRow(
                
                plotOutput("GDPgraph", height = "400", width = "600"))
                      
              ),
  
      
      
         tabItem("Source",
          
          fluidRow( 
            box(p("The sources we used are...."))))
  
  
      
      )
    ) 
  )
      
          





