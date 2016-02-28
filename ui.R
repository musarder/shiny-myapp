library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(

    # Application title
    headerPanel("Air Pollution in China"),

    # Sidebar with controls to select a city
    sidebarPanel(
        selectInput("city", "Choose a city:",
                    choices = c("Beijing", "Shanghai", "Tianjin", "Xiamen", "Chongqing", "Hangzhou"))),

    # Show a plot of the air pollution of the chosen city
    mainPanel(
        plotOutput("plot_c")
    )
))
