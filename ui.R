library(shiny)
library(shinydashboard)

#####################################################
datavariable <- read.table("datafordeathfile")

countrydata <- read.table("c_w_nationalfile")

sociodata <- read.table("EbolaGDPfile")

casesdata <- read.table("c_w_casesfile")

cases_countrydata <- read.table("national_casesfile")

#########################################################

datavariable$Timeline <- as.Date(as.character(datavariable$Timeline))
datavariable$Localite <- as.character(datavariable$Localite)
datavariable$Value <- as.numeric(datavariable$Value)



countrydata$NewDate <- as.Date(as.character(countrydata$NewDate))




casesdata$Timeline <- as.Date(as.character(casesdata$Timeline))
casesdata$Localite <- as.character(casesdata$Localite)
casesdata$Value <- as.numeric(casesdata$Value)


cases_countrydata$NewDate <- as.Date(as.character(cases_countrydata$NewDate))



############################################################

dashboardPage(skin = "green",
  
  
  dashboardHeader(title = "Tracking The Spread: Caroline Burke and Patrick Murphy", titleWidth = 600),
  
  
  
  dashboardSidebar(width = 120,
    
    
    sidebarMenu(
   
     menuItem("Intro", tabName = "Introduction"),
     
     menuItem("Data Issues", tabName = "dataissues"),
    
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
                box(background = "black", width = 6, p("Ebola Virus Disease is a severe and sometimes fatal disease spread to humans from wild animals and is transmitted from human to human. It is transmitted by contact with blood, organs, or bodily fluids of an infected individual. It first appeared in 1976. These first outbreaks originated in villages of Central Africa near tropical rainforests, but the most recent epidemic affected major urban areas as well as rural areas. Controlling the disease spread has posed much difficulty in past outbreaks. There are no Ebola vaccines or licensed treatments proven to neutralize the virus. The most recent outbreak (March 2014) was the largest and most complex outbreak since the discovery of the disease.  Guinea, Liberia, and Sierra Leone were the countries most affected. They all have weak health systems, lack resources, and have recently emerged from conflict and instability.  This is a factor that led to why these countries were so badly affected. There are three genera and 5 species identified. The Zaire species caused the 2014 outbreak. This outbreak was so large that WHO Director-General declared it a Public Health Emergency of International Concern under the International Health Regulations.
Due to both our interest in medicinal science and spread of infectious disease we decided to focus our project on this outbreak.")),
                box(background = "green", img(src = "ebola_ecology_800px.jpg", width = 500))
                
              )),
  #############################     
      
      tabItem("dataissues",
              
              fluidRow(
                box(background = "black", p("This project has allowed us to explore this unique data set and incorporate other factors into the disease spread. However, there have been major obstacles in wrangling this data set. 
In organizing our data we discovered the importance of data reporting and data entry. The ability to enter data consistently and correctly is an extremely important concept"),
                    p("During an epidemic such as this one it is understandable how the chaos could lead to inconsistent data collection, especially at the beginning of the data collection process. If you were to investigate the original data set we used, you would notice that categories such as, “Suspected Cases”, and “Confirmed Cases” existed. Such data means very little unless it’s the sole purpose of what you are attempting to research. Eventually, once time went by, a routine seemed to emerge from the researchers and there were only “Cases” and “Deaths” as categories. When creating this app, we simply looked at those two areas of data. Although as you will notice in the animated portion in our “Total Deaths” and “Total Cases” tabs, a large time block is missing from our data. It seemed that for a month long time period around July 2014, only data was collected on a National level, not a local level."),
                    p("Such inconsistencies can make data visualization much harder to execute which will make their purpose, education and prevention, also more difficult. We hope this app not only offers new knowledge and understanding regarding the 2014 Ebola Epidemic, but also how vital it can be to have organized systems of tracking and reporting of diseases in areas of the world such as this one so that future epidemics are not able to do such widespread harm.")
                    
                    ),
                
                box(background = "black", 
                    a("Click here to download original datatable", href="https://data.humdata.org/dataset/rowca-ebola-cases"),
                    br(),
                    br(),
                    p("This is...."))
              
              
              
              )),
  
  
  
 ########################### 
  
  tabItem("dashboard",
              
              
          fluidRow(box(background = "blue", width = 12, p("This page shows an animated geographical spread of the total deaths that occured in each localite. The radius of the blue circles represent the value of the amount of people that have died in that specific place up to that point. The graph at the bottom shows the same information as the map and is controlled by the second date slider. Be sure to use the play button and to investigate how the socioeconomic data correlates with the number of deaths.")
            
            
          )),
          
          
          fluidRow(
                 box(background = "black", leafletOutput("Map", height = 400)),
                 
                 
                 
                 box(title = "Controls", background = "black", status = "primary",
                     
                     sliderInput("Dateslider", "Looping Animation:", 
                                 min(datavariable$Timeline), 
                                 max(datavariable$Timeline), 
                                 min(datavariable$Timeline),
                                 step = 1, 
                                 animate=
                                   animationOptions(interval=75, loop=TRUE)),
                 
                 
                     
                     
                     sliderInput("Localitegraphslider", "Graph Slider",
                             min = min(datavariable$Timeline), 
                             max = max(datavariable$Timeline),
                             value = min(datavariable$Timeline)),
                     
                     
                     selectInput("selectsociodeath", label = ("Socio-Economic Data"), 
                                 choices = colnames(datavariable)[14:18]),
                     
                     selectInput("selectcolordeath", label = ("Color by Localite or Country"), 
                                 choices = colnames(datavariable)[1:2]))
                   
                
              
                 ),
               
               
              fluidRow(
                 box(width = 12, background = "blue", plotOutput("death_graph", height = "400", width = "1050")))),
    
    
####################################    

      tabItem("Cases",
              
              
              fluidRow(box(background = "blue", width = 12, p("This page shows an animated geographical spread of the total number of cases that occured in each localite. The radius of the blue circles represent the value of the amount of people that were diagnosed in that specific place up to that point. The graph at the bottom shows the same information as the map and is controlled by the second date slider. Be sure to use the play button and to investigate how the socioeconomic data correlates with the number of cases.")
              )),
              
              fluidRow(
                box(background = "black", leafletOutput("casesMap", height = 400)),
                
                box(
                  title = "Controls", background = "black", status = "primary",
                 
                  
                  sliderInput("casesslider", "Looping Animation:", 
                              min(casesdata$Timeline), 
                              max(casesdata$Timeline), 
                              min(casesdata$Timeline),
                              step = 1, 
                              animate=
                                animationOptions(interval=75, loop=TRUE)),
                  
                  sliderInput("casesgraphslider", "Graph Slider",
                              
                              min = min(casesdata$Timeline), 
                              max = max(casesdata$Timeline), 
                              value = min(casesdata$Timeline)),
                  
                  
                  selectInput("selectsociocases", label = ("Size by Socio-Economic Data"), 
                              choices = colnames(casesdata)[12:16]),
                  
                  selectInput("selectcolorcases", label = ("Color by Localite or Country"), 
                              choices = colnames(casesdata)[1:2])
                  
                  )
              ),
              
              
              
              fluidRow(
                box(width=12, background = "blue", plotOutput("cases_graph", height = "400", width = "1050")))),
      
      
#####################################################################      
    
      tabItem("Country",
            
              
              fluidRow(
                box(width = 12, background = "black",p("The plots printed out below show an overview of the rise of deaths and total cases in each of the countries."))
                
              ),
              
              fluidRow(
               box(title = "Total Deaths", width = 12, background = "blue",
              plotOutput("country_graph", height = "400", width = "1000"))),
              
              
              fluidRow(
                box(title = "Total Cases", width = 12, background = "blue",
                plotOutput("casescountrygraph", height = "400", width = "1000")))
              
              
              
              ),
      
              
              

#################################################################################




              
      tabItem("Socio",        
              
              fluidRow(box(background= "blue", p("If you are interested in how two of the socioeconomic data types interact with eachother, use the two select boxes below to chagne the x and y variables on the corresponding graph. Enjoy!")
                
                
              )),          
                
              fluidRow(
             
                  
              box(status = "primary", background = "black", 
                  
                  selectInput("selectX", label = ("Select box for X"), 
                              choices = colnames(sociodata)), 
                              
              
                
                      
                  selectInput("selectY", label = ("Select box for Y"),
                              choices = colnames(sociodata)))),
              
              
              
              
              fluidRow(box(background = "blue", width = 6,
                
                plotOutput("GDPgraph", height = "400", width = "500"))
                      
              )),
  
################################      
      
         tabItem("Source",
          
          fluidRow( 
            box(a("Ebola virus disease. (n.d.). Retrieved April 02, 2017, from http://www.who.int/mediacentre/factsheets/fs103/en/

Market research your competitors and peers trust. (n.d.). Retrieved April 02, 2017", href="http://www.euromonitor.com/"),
                  
                br(),
                br(),
                  
                  a("UNdata. UN, n.d. Web.", href= "http://data.un.org/Default.aspx"),
                
                br(),
                br(),
                
                a("Virus Ecology Graphic. Digital image. CDC. CDC, n.d. Web. 4 Apr. 2017.", href= "https://www.cdc.gov/vhf/ebola/resources/virus-ecology.html"),
                
                br(),
                br(),
                
                a("Sub-national Time Series Data on Ebola Cases and Deaths in Guinea, Liberia, Sierra Leone, Nigeria, Senegal and Mali since March 2014. Sub-national Time Series Data on Ebola Cases and Deaths in Guinea, Liberia, Sierra Leone, Nigeria, Senegal and Mali since March 2014 - Humanitarian Data Exchange. HDX, n.d. Web. 04 Apr. 2017.", href="https://data.humdata.org/dataset/rowca-ebola-cases"))))
  
  
      
      )
    ) 
  )
      
          





