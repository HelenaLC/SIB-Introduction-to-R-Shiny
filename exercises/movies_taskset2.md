# Movies app part 2

### Task 1: Action button

1. add an `actionButton` to the `sidebarPanel`  
of your Shiny app from task 3
2. update the server function such that  
the plot refreshes only(!) upon button-click  
(regardless of changes in the inputs)

### Task 2: Tabsets

- add a `tabsetPanel` inside of the mainPanel:
    - Tab 1: scatter plot from task 1
	- Tab 2: `dataTableOutput` displaying the head of the table  
	(task 1 in previous session)
	- Tab 3: `sliderInput` & filtered scatter plot  
	(task 5 in previous session)
- inputs of both scatter plots should be shared
- 1st scatter plot should be controlled by the `actionButton`
- 2nd scatter should be “live” / reactive to inputs

*Hint: Scatter `plotOutput`s should have unique IDs*

***

Our app currently has 4 inputs:

- 2 `selectInput`s to select columns from movies
- 1 `actionButton` to control tab 1’s scatter plot
- 1 `sliderInput` to subset the data for tab 3’s scatter plot

***

### Task 3: More reactivity

1. Create a 4th tab that outputs:  
2 `textOutput`s and 1 `tableOutput`
2. The two `textOutput`s should show  
the mean of the respective `input$*` (unfiltered) column  
(if the column is not numeric, output "Not a numeric")
3. The `tableOutput` should display the 2 selected columns  
with the rows subsetted by the `sliderInput`
4. All outputs from tab 4 should be controlled  
by the `actionButton` from task 1
5. To make navigation easier, you can  
move the `sliderInput` to the `sidebarPanel`