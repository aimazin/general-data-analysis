
ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)



setwd('~/Downloads')
library(readxl)
library(tidyr)
library(dplyr)
library(readr)
sus <- read.csv("C:/Users/aimaz/Downloads/globsusmodrenew.csv")





install.packages('shiny')
install.packages('shinydashboard')


library(shiny)
library(shinydashboard)
ui <- dashboardPage(
  dashboardHeader(title = "Global Renewable Sustainibility Model"),
  dashboardSidebar(),
  dashboardBody(plotOutput("plot1"),plotOutput("plot2"), 
                width = c("30%","30%"),
                height = c("100px","100px"),
  )
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    plot(sus$Time, 
         (sus$Total.final.energy.consumption..TFEC...TJ...1.1_TOTAL.FINAL.ENERGY.CONSUM.
    ),title(main = "Actual consumption of energy",
            xlab = "Years",
            ylab = "Energy Consumption"))
  })
  output$plot2 <- renderPlot({
    plot(sus$Time, 
         (sus$bestmod
         ),title(main = "Model's consumption of energy",
                 xlab = "Years",
                 ylab = "Energy Consumption"))
  })
}       

shinyApp(ui, server)

runGitHub("general-data-analysis",username = getOption("aimazin"))