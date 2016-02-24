
library(leaflet)
library(rgdal)
library(sp)
library(shiny)

ui <- fluidPage(
  fileInput("archivo","Archivo",multiple = F),
  plotOutput("plot"),
  verbatimTextOutput("stats")
)

server <- function(input, output, session){
  
  data <- reactive({
    if(is.null(input$archivo)) return(NULL)
    else
    read.csv(input$archivo$datapath,sep = ",",header = T)
  })
  
  output$stats <- renderPrint({
    summary(data())
  })
  
  output$plot <- renderPlot({
    plot(data())
  })
 
}

shinyApp(ui, server)
