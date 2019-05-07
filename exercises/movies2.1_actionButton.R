shinyApp(
    ui = fluidPage(
        sidebarLayout(
            sidebarPanel = sidebarPanel(
                selectInput("xvar", "x-axis:", names(movies), selected = "Body_Count"),
                selectInput("yvar", "y-axis:", names(movies), selected = "IMDB_Rating"),
                actionButton("go", "Refresh")
            ),
            mainPanel = mainPanel(
                plotOutput("scatter")
            )
        )
    ),
    server = function(input, output) {
        movies <- read.csv("movies.csv")
        xvar <- eventReactive(input$go, input$xvar)
        yvar <- eventReactive(input$go, input$yvar)
        output$scatter <- renderPlot(
            ggplot(movies, aes_string(xvar(), yvar())) + 
                geom_point())

    }
)