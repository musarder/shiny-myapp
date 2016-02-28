library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {

    # Return the requested dataset
    cityInput <- reactive({
        switch(input$city,
               "Beijing" = "Beijing",
               "Shanghai" = "Shanghai",
               "Tianjin" = "Tianjin",
               "Xiamen" = "Xiamen",
               "Chongqing" = "Chongqing",
               "Hangzhou" = "Hangzhou")
    })
    output$plot_c <- renderPlot({
        data = read.csv("data_bc.csv")
        data$Date = substr(data$Date, 1, 4)
        data_x = filter(data, City == cityInput(), Date == c("2014", "2015"))
        data_x$AQI = as.numeric(data_x$AQI)
        qplot(x = Date, y = AQI, data = data_x, geom = "boxplot")
    })
})
