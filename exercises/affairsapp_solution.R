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
# 8. tab 1: oxplot of input 1 vs. input 2
# 9. tab 2: `radioButtons` for "t-test" and "ANOVA", and 
#    a `verbatimTextOutput` rendering the results from `t.test()`/`anova()`
#
# ==============================================================================
# preamble
# ------------------------------------------------------------------------------
# load required packages
library(dplyr)
library(ggplot2)
library(shiny)

# specify categorical & continuous variables
cat_vars <- c("sex", "child", "religious", "education", "occupation", "rate")
cont_vars <- c("age", "ym", "nbaffairs")

# load data & convert categorical variables to factors
affairs <- read.csv("affairs.csv", stringsAsFactors = FALSE) %>% 
  mutate_at(cat_vars, as.factor)

# ==============================================================================
# ui
# ------------------------------------------------------------------------------
ui <- fluidPage(
  titlePanel(
    title = "Affairs dataset"
  ),
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
        inputId = "cat", 
        label = "Select a categorical variable:",
        choices = cat_vars),
      selectizeInput(
        inputId = "cont", 
        label = "Select a continuous variable:",
        choices = cont_vars),
      selectizeInput(
        inputId = "cat_lvls",
        label = "Categorical variable levels:",
        multiple = TRUE, 
        choices = NULL),
      sliderInput(
        inputId = "cont_range",
        label = "Continuous variable range:", 
        value = c(1, 2), min = 0, max = 10)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(
          title = "Boxplot",
          plotOutput(
            outputId = "box")),
        tabPanel(
          title = "Stats test",
          radioButtons(
            inputId = "test", 
            label = "Choose a statistic test", 
            choices = c("t-test", "anova")),
          verbatimTextOutput(
            outputId = "res_table"))
      )
    )
  )
)

# ==============================================================================
# server
# ------------------------------------------------------------------------------
server <- function(input, output, session) {
  # update slider when categorical variable selection changes
  observeEvent(input$cat, 
    updateSelectizeInput(session, 
      inputId = "cat_lvls", 
      choices = levels(affairs[, input$cat]),
      server = TRUE))
  
  # update slider when continuous variable selection changes
  observeEvent(input$cont, {
    x <- affairs[, input$cont]
    updateSliderInput(session, 
      inputId = "cont_range", 
      min = min(x), max = max(x),
      value = range(x))
  })
  
  # data subsetting according to `selectizeInput` & `sliderInput`
  subset <- reactive({
    fil1 <- affairs[, input$cat] %in% input$cat_lvls     # filter selected category levels
    fil2 <- affairs[, input$cont] >= input$cont_range[1] # filter continuous variable..
    fil3 <- affairs[, input$cont] <= input$cont_range[2] # ..within selected range
    affairs[fil1 & fil2 & fil3, ]
  })
  
  # 1st tab: Box plot
  output$box <- renderPlot({
    ggplot(subset(), aes_string(
      x = input$cat, y = input$cont, fill = input$cat)) +
      geom_boxplot() + theme_bw()
  })
  
  # `reactive` for statistics test
  test_res <- reactive({
    # check that at least 2 categorical levels are selected
    req(length(input$cat_lvls) > 1)
    
    # get testing function
    fun <- switch(input$test, 
      "t-test" = t.test, 
      "anova" = function(x) anova(lm(x)))

    # get categorical & continuous data to test
    cont <- subset()[, input$cont]
    cat <- subset()[, input$cat]
    
    # apply t.test(...)/anova(lm(...))
    fun(cont ~ as.factor(cat))
  })
  
  # 2nd tab: Statistical testing results
  output$res_table <- renderPrint(test_res())
  
}
shinyApp(ui, server)