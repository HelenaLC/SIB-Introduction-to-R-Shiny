shinyApp(
    ui = fluidPage(
        sidebarLayout(
            sidebarPanel(
                selectInput("xvar", "x-axis:", names(movies), selected = "Body_Count"),
                selectInput("yvar", "y-axis:", names(movies), selected = "IMDB_Rating"),
                sliderInput("slider", "Range to plot:", min = 0, max = 1000, value = c(0, 100)),
                actionButton("go", "Refresh")
            ),
            mainPanel(
                tabsetPanel(
                    tabPanel("Scatter plot", 
                        plotOutput("scatter1")),
                    tabPanel("Table", 
                        tableOutput(outputId = "table1")),
                    tabPanel("Subset plot",
                        plotOutput(outputId = "scatter2")),
                    tabPanel("Subset Info",
                        textOutput("mean1"),
                        textOutput("mean2"),
                        tableOutput("table2"))
                )
            )
        )
    ),
    server = function(input, output) {
        # load packages & data
        library(dplyr)
        library(ggplot2)
        movies <- read.csv("movies.csv")
        
        xvar <- eventReactive(input$go, input$xvar)
        yvar <- eventReactive(input$go, input$yvar)
        
        # tab 1: scatter
        output$scatter1 <- renderPlot({
            ggplot(movies, aes_string(
                x = xvar(), 
                y = yvar())) +
                geom_point()
        })
        
        mx <- eventReactive(input$go, 
            ifelse(is.numeric(movies[, input$xvar]), 
                yes = mean(movies[, input$xvar]), 
                no = "Not a numeric"))
        my <- eventReactive(input$go, 
            ifelse(is.numeric(movies[, input$yvar]), 
                yes = mean(movies[, input$yvar]), 
                no = "Not a numeric"))
        
        subset <- reactive({
            range <- input$slider
            filter(movies,
                Body_Count >= range[1],
                Body_Count <= range[2])
        })
        
        table <- eventReactive(input$go, 
            select(subset(), input$xvar, input$yvar))
        
        # tab 2: table head
        output$table1 <- renderTable(head(movies))
        
        # tab 3: filtered scatter
        output$scatter2 <- renderPlot({
            range <- input$slider
            ggplot(subset(), aes_string(
                x = input$xvar, 
                y = input$yvar)) +
                geom_point()
        })
        
        # tab 4: means of selected variable
        output$mean1 <- renderText(mx())
        output$mean2 <- renderText(my())
        
        # tab 4: filtered 2-column table
        output$table2 <- renderTable(table())
    }
)
