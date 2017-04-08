library(shiny)
library(shinydashboard)
library(dplyr)
library(leaflet)
library(scales)


function(input, output) {
  #####################################################
  
  datavariable <- read.table("datafordeathfile")
  
  countrydata <- read.table("c_w_nationalfile")
  
  sociodata <- read.table("EbolaGDPfile")
  
  casesdata <- read.table("c_w_casesfile")
  
  cases_countrydata <- read.table("national_casesfile")
  
  
  #################################################
  
  datavariable$Timeline <- as.Date(as.character(datavariable$Timeline))
  datavariable$Localite <- as.character(datavariable$Localite)
  datavariable$Value <- as.numeric(datavariable$Value)
  
  
  
  countrydata$Timeline <- as.Date(as.character(countrydata$Timeline))
  
  
  
  
  casesdata$Timeline <- as.Date(as.character(casesdata$Timeline))
  casesdata$Localite <- as.character(casesdata$Localite)
  casesdata$Value <- as.numeric(casesdata$Value)
  
  
  cases_countrydata$Timeline <- as.Date(as.character(cases_countrydata$Timeline))
  
  
  #########################################
  
  
  
  output$Map <- renderLeaflet({

    #print(datavariable %>%  filter(NewDate == as.Date(input$Dateslider)))
    #print(as.Date(input$Dateslider))
    #print(class(datavariable$Localite))
    #print(filter(datavariable, as.numeric(NewDate) == as.numeric(input$Dateslider)))
    #class(datavariable$numericvalue)
    
    
    
     datavariable %>% 
      
      
     filter(Timeline == min(datavariable$Timeline)) %>%
       
      
 
      leaflet() %>%
      setView(lng = -9.311828, lat = 10.38279, zoom = 4) %>%
      addTiles() %>%
      addCircles(radius = ~Value*150, 
                       label = ~Localite, 
                       fillOpacity = .05)
        
  })
  
  
  
  observe({
    
   if(input$Dateslider %in% datavariable$Timeline) {
  
     
     
    datavariable %>% 
       
    filter(Timeline == as.Date(input$Dateslider)) %>%
    
    leafletProxy("Map", data=.) %>% 
    
    clearShapes() %>%
       
    addCircles(radius = ~Value*150, 
              label = ~Localite, 
              fillOpacity = .05) 
 
     
   }
    
  })
  
  #######################################
  
  
  output$casesMap <- renderLeaflet({
    
    #print(datavariable %>%  filter(NewDate == as.Date(input$Dateslider)))
    #print(as.Date(input$Dateslider))
    #print(class(datavariable$Localite))
    #print(filter(datavariable, as.numeric(NewDate) == as.numeric(input$Dateslider)))
    #class(datavariable$numericvalue)
    
    
    
    casesdata %>% 
      
      
      filter(Timeline == min(casesdata$Timeline)) %>%
      
      
      
      leaflet() %>%
      setView(lng = -9.311828, lat = 10.38279, zoom = 4) %>%
      addTiles() %>%
      addCircles(radius = ~Value*150, 
                 label = ~Localite, 
                 fillOpacity = .05)
    
  })
  
  
  
  observe({
    
    if(input$casesslider %in% casesdata$Timeline) {
      
      
      
      casesdata %>% 
        
        filter(Timeline == as.Date(input$casesslider)) %>%
        
        leafletProxy("casesMap", data=.) %>% 
        
        clearShapes() %>%
        
        addCircles(radius = ~Value*150, 
                   label = ~Localite, 
                   fillOpacity = .05) 
      
      
    }
    
  })
  
 ########################################### 
  
  output$death_graph <- output$death_graph <- renderPlot({
    
   
      datavariable %>% 
      
      
      filter(Timeline == as.Date(input$Localitegraphslider)) %>%
     
    
    
   
    ggplot(aes(Localite, Value)) + geom_point(aes_string(colour = input$selectcolordeath, size = input$selectsociodeath)) + theme(axis.text.x = element_text(angle = 60, hjust = 1))
  })
 

  #################################
  
  
  
  
  
  output$cases_graph <- renderPlot({
    
    
    casesdata %>%
      
      filter(Timeline == as.Date(input$casesgraphslider)) %>% 
      
      
      ggplot(aes(Localite, Value)) + geom_point(aes_string(colour = input$selectcolorcases, size = input$selectsociocases)) + theme(axis.text.x = element_text(angle = 60, hjust = 1))
  })
  
  
  
  
  
  
  
  
  
 ############################### 
  
  
  output$country_graph <- renderPlot({
    
    
    countrydata %>% 
      
    
    #ggplot(aes(NewDate, Numericvalue)) + geom_point(aes(colour=Country)) + theme(axis.text.x = element_text(size = 6, angle = 90, hjust = 1)) 
      
    ggplot(aes(Timeline, Value)) + geom_point(aes(colour=Country)) 
      
      
  })
  
  output$summary <- renderPrint({
    summary(countrydata)
  })
  
#################################################  
  
  output$casescountrygraph <- renderPlot({
    
    cases_countrydata %>%
      
      ggplot(aes(Timeline, Value)) + geom_point(aes(colour=Country))
    
  
  })
  
  output$summary <- renderPrint({
    summary(cases_countrydata)
  })
  
   
######################################################  
  


  output$GDPgraph <- renderPlot ({
    
    sociodata %>% 
      
      ggplot(aes_string(input$selectX, input$selectY)) + geom_point(aes(colour=Country))
    
    
    })
    
    
 ######################################################## 
  
  
  
  
  


}



  
