# SIB Introduction to R Shiny
# Phil Cheng & Helena L. Crowell
# May 6th, 2019
# University of Zurich, Campus Irchel
# seminar room Y32-E-06, 9:00-17:00
#
# ==============================================================================
# Final taks: Affairs app 
# ------------------------------------------------------------------------------
#
# 1. Create a Shiny app with a `sidebarLayout`
#
# the app should have 4 inputs in its `sidebarPanel`:
#
# 2. input 1 should allow selection of catergorical columns only
# 3. input 2 should allow selection of continuous columns only
# 4. input 3: a `selectizeInput` for the levels of the category from input 1
# 5. input 4: a `sliderInput` for the range of the continuous variable from input 2
#
# 6. Use `observeEvent` with `updateSelectizeInput`/`updateSliderInput`
#    to update inputs 3 & 4 depending on the selection by inputs 1 & 2
#
# the app should have 2 tabs in its `mainPanel`:
#
# 8. tab 1: boxplot of input 1 vs. input 2
# 9. tab 2: `radioButtons` for "t-test" and "ANOVA", and 
#    a `verbatimTextOutput` rendering the results from `t.test()`/`anova()`
#
# - please use meaninful names for all `output$*` and `input$*`s
# - test your app as you go & make sure everything works as it should
# - when you're done, see if there are ways to simplify 
#   your code / app (there usually are!)
# > a solution can be written with ~100 lines in total, 
#   including lots of comments & line-breaks for better readability
#
# ------------------------------------------------------------------------------

ui <- fluidPage(
  titlePanel(
    title = "Affairs dataset"
  ),
  sidebarLayout(
    sidebarPanel(
      # use `selectizeInput` for multiple choices
      selectizeInput(
        inputId = "id",
        label = "Categorical variable levels:",
        multiple = TRUE, 
        choices = NULL)
    ),
    mainPanel(
      tabsetPanel()
    )
  )
)

server <- function(input, output, session) {
  # load packages & data
  library(ggplot2)
  affairs <- read.csv("affairs.csv", stringsAsFactors = FALSE)
  
  # use `observeEvent` to update the `selectizeInput` 
  # when categorical variable selection changes
  observeEvent(input$..., {
    updateSelectizeInput(session, 
      inputId = "input4", 
      choices = unique(affairs[, input$...]))
  })
  
  # use `observeEvent` to update the `sliderInput` 
  # when continuous variable selection changes
  ...
  
  # `reactive` for statistics test
  test_res <- reactive({
    # check that at least 2 categorical levels are selected
    req(length(input$input3) > 1)
    
    # get testing function
    fun <- switch(input$<radioButtons_input>, 
      "t-test" = t.test, 
      "anova" = function(x) anova(lm(x)))
    
    # get categorical & continuous data to test
    cont <- <reactive_data.frame>[, input$input2]
    cat <- <reactive_data.frame>[, input$input1]
    
    # apply t.test(...)/anova(lm(...))
    fun(cont ~ as.factor(cat))
  })
}

shinyApp(ui, server)
