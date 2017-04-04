library(shiny)
library(shinydashboard)



dashboardPage(skin = "green",
  
  
  dashboardHeader(title = "Basic dashboard"),
  
  
  
  dashboardSidebar(width = 100,
    
    
    sidebarMenu(
   
     menuItem("Intro", tabName = "Introduction"),
    
     menuItem("Localite", tabName = "dashboard"),
    
     
     menuItem("Country", tabName = "Country"),
     
     menuItem("Sources", tabName = "Source")
     
     )
     
     ),
  
  
  
  
  
  
  
  dashboardBody(
    
    
    
    
    

    tabItems(
      
      tabItem("Introduction",
              
              fluidRow( 
                box(p("Ebola is....."))
                
              )),
      
      
      tabItem("dashboard",
    
              
              
              fluidRow(
                 box(background = "black", leafletOutput("Map", height = 250)),
                 
                 box(
                   title = "Controls", background = "black", status = "primary",
                   #sliderInput("Dateslider", "Date:", 
                   #min = min(datafordeath$NewDate), 
                   #max = max(datafordeath$NewDate), 
                   #value = min(datafordeath$NewDate))
                   sliderInput("Dateslider", "Looping Animation:", 
                               min(datafordeath$NewDate), 
                               max(datafordeath$NewDate), 
                               min(datafordeath$NewDate),
                               step = 1, 
                               animate=
                                 animationOptions(interval=300, loop=TRUE)))),
               
               
              fluidRow(
                 box(plotOutput("death_graph", height = "400", width = "1000")))),
    
    
    
    
      tabItem("Country",
            
              
              fluidRow(
              box(plotOutput("country_graph", height = "400", width = "1000"))),
                
                
              fluidRow(
              #box(selectInput("selectX", label = h3("Select box for X"), 
                              #choices = c("Household Size" = c_w_national$Household_Size, "Percent Urban" = c_w_national$Percent_Urban,  "Percent with Internet" = c_w_national$Percent_using_Internet), 
                              #selected = "Household Size"),
                  
              #box(selectInput("selectY", label = h3("Select box for Y"), 
                              #choices = c("Household Size" = c_w_national$Household_Size, "Percent Urban" = c_w_national$Percent_Urban,  "Percent with Internet" = c_w_national$Percent_using_Internet), 
                              #selected = "Household Size"),
              
              #plotOutput("GDPgraph", height = "400", width = "600")))
                
              
                
                  
              box(status = "primary", background = "black", selectInput("selectX", label = h3("Select box for X"), 
                              choices = c("Household Size" = EbolaGDP$Household_Size, 
                                          "Percent Urban" = EbolaGDP$Percent_Urban,  
                                          "Percent with Internet" = EbolaGDP$Percent_using_Internet), 
                              selected = "Household Size"),
                  
              box(status = "primary", background = "black", selectInput("selectY", label = h3("Select box for Y"),
                              choices = c("Household Size" = EbolaGDP$Household_Size, 
                                          "Percent Urban" = EbolaGDP$Percent_Urban,  
                                          "Percent with Internet" = EbolaGDP$Percent_using_Internet), 
                              selected = "Household Size")))),
              
              fluidRow(
                
                box(plotOutput("GDPgraph", height = "400", width = "600")))
                      
              
              
              
                
  )
    ,
  
  tabItem("Source",
          
          fluidRow( 
            box(p("The sources we used are...."))
          ))
  
  )) )
      
          





