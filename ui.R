library(shiny)
library(shinydashboard)



dashboardPage(skin = "green",
  
  
  dashboardHeader(title = "Tracking The Spread: Caroline Burke and Patrick Murphy", titleWidth = 600),
  
  
  
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
                box(background = "black", width = 12, p("Ebola Virus Disease is a severe and sometimes fatal disease spread to humans from wild animals and is transmitted from human to human. It is transmitted by contact with blood, organs, or bodily fluids of an infected individual. It first appeared in 1976. These first outbreaks originated in villages of Central Africa near tropical rainforests, but the most recent epidemic affected major urban areas as well as rural areas. Controlling the disease spread has posed much difficulty in past outbreaks. There are no Ebola vaccines or licensed treatments proven to neutralize the virus. The most recent outbreak (March 2014) was the largest and most complex outbreak since the discovery of the disease.  Guinea, Liberia, and Sierra Leone were the countries most affected. They all have weak health systems, lack resources, and have recently emerged from conflict and instability.  This is a factor that led to why these countries were so badly affected. There are three genera and 5 species identified. The Zaire species caused the 2014 outbreak. This outbreak was so large that WHO Director-General declared it a Public Health Emergency of International Concern under the International Health Regulations.
Due to both our interest in medicinal science and spread of infectious disease we decided to focus our project on this outbreak. This project has allowed us to explore this unique data set and incorporate other factors into the disease spread.  However, there have been major obstacles in wrangling this data set. 
In organizing our data we discovered the importance of data reporting and data entry. The ability to enter data consistently and correctly is an extremely important concept. The slight altering of names or values can disrupt the entire data set. In order to analyze an outbreak like this one correctly there needs to be a meticulous organization of how the data should be recorded and entered into a data. A simply difference in capitalization or added spaces at the end of titles can lead to completely different results on a computer program. This outbreak and the conclusions people will be able to draw from looking at an interactive map and specific graphs could be extremely applicable in prevention and education for future disease outbreaks. With better data collection, accessibility, and distribution there could be easier worldwide contributions in helping to prevent future outbreaks. 
"))
                
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
                box(background = "black", leafletOutput("casesMap", height = 400)),
                
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
            box(p("Ebola virus disease. (n.d.). Retrieved April 02, 2017, from http://www.who.int/mediacentre/factsheets/fs103/en/

Market research your competitors and peers trust. (n.d.). Retrieved April 02, 2017, from http://www.euromonitor.com/"),
                  
                  
                  p("UNdata. UN, n.d. Web. <http://data.un.org/CountryProfile.aspx?crName=Senegal>."))))
  
  
      
      )
    ) 
  )
      
          





