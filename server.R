library(shiny)
library(shinydashboard)
library(dplyr)
library(leaflet)


function(input, output) {
  datavariable <- read.table("datafordeathfile")
  
  countrydata <- read.table("c_w_nationalfile")
  
  
  datavariable$NewDate <- as.Date(as.character(datavariable$NewDate))
  datavariable$Localite <- as.character(datavariable$Localite)
  datavariable$Value <- as.numeric(datavariable$Value)
  
  
  output$Map <- renderLeaflet({

    #print(datavariable %>%  filter(NewDate == as.Date(input$Dateslider)))
    #print(as.Date(input$Dateslider))
    #print(class(datavariable$Localite))
    #print(filter(datavariable, as.numeric(NewDate) == as.numeric(input$Dateslider)))
    #class(datavariable$numericvalue)
    
     datavariable %>% 
      
      
     filter(NewDate == min(datafordeath$NewDate)) %>%
       
      
 
      leaflet() %>%
      setView(lng = -9.311828, lat = 10.38279, zoom = 4) %>%
      addTiles() %>%
      addCircles(radius = ~Value*150, 
                       label = ~Localite, 
                       fillOpacity = .05)
        
  })
  
  
  
  observe({
    
   if(input$Dateslider %in% datavariable$NewDate) {
  
     
     
    datavariable %>% 
       
    filter(NewDate == as.Date(input$Dateslider)) %>%
    
    leafletProxy("Map", data=.) %>% 
    
    clearShapes() %>%
       
    addCircles(radius = ~Value*150, 
              label = ~Localite, 
              fillOpacity = .05) 
 
     
   }
    
  })
  
  
  
  
  
  
 ########################################### 
  
  output$death_graph <- output$death_graph <- renderPlot({
    
   
      datavariable %>% 
      
      
      filter(NewDate == as.Date(input$Dateslider)) %>%
     
    
    
   
    ggplot(aes(Localite, Value)) + geom_point(aes(colour = Localite)) + theme(axis.text.x = element_text(angle = 60, hjust = 1))
  })
 

 ############################### 
  
  
  output$country_graph <- renderPlot({
    
    
    countrydata %>% 
      
    
    ggplot(aes(NewDate, Numericvalue)) + geom_point(aes(colour=Country)) + theme(axis.text.x = element_text(size = 6, angle = 60, hjust = 1))
      
      
      
      
  })
######################################################  
  


  output$GDPgraph <- renderPlot ({
    
    countrydata %>% 
      
      ggplot(aes(input$selectX, input$selectY)) + geom_point(aes(size=GDP, colour=Country))
    
    
    })
    
    
 ######################################################## 
  
  
  
  
  


}



  
