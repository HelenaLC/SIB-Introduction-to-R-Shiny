movies <- read.csv("movies.csv")

shinyApp(
    ui = fluidPage(
        sidebarLayout(
            sidebarPanel(
                selectInput("xvar", "x-axis:", names(movies), selected = "Body_Count"),
                selectInput("yvar", "y-axis:", names(movies), selected = "IMDB_Rating"),
                
                actionButton("go", "Refresh")
            ),
            mainPanel(
                tabsetPanel(
                    tabPanel("Scatter plot", 
                        plotOutput("scatter1")),
                    tabPanel("Table", 
                        dataTableOutput(outputId = "table")),
                    tabPanel("Subset plot",
                        plotOutput(outputId = "scatter2"),
                        sliderInput("slider", "Range to plot:", 
                            min = 0, max = 1000, value = c(0, 100)),
                        textOutput(outputId = "text")))
            )
        )
    ),
    server = function(input, output, session) {
        # load packages & data
        library(dplyr)
        library(ggplot2)
        
        # 1st tab: `actionButton` controlled scatter plot
        xvar <- eventReactive(input$go, input$xvar)
        yvar <- eventReactive(input$go, input$yvar)
        output$scatter1 <- renderPlot(
            ggplot(movies, aes_string(xvar(), yvar())) + 
                geom_point())
        
        # 2nd tab: `dataTableOutput` displaying dataset head
        output$table <- renderDataTable(head(movies))
        
        # 3rd tab: reactive filtered scatter plot
        subset <- reactive({
            range <- input$slider
            filter(movies,
                Body_Count >= range[1],
                Body_Count <= range[2])
        })
        output$scatter2 <- renderPlot(
            ggplot(subset(), aes_string(
                x = input$xvar, 
                y = input$yvar)) +
                geom_point())
    }
)