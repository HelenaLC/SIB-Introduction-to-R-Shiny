# Movies app part 1

### Task 0: Creating an app

1. Create a Shiny app from scratch by navigating to  
**File** > **New File** > **Shiny Web App...**  
(place the file inside the `SIB-Shiny-intro` folder)
2. Launch the app by opening **app.R** and clicking **Run App**
3. Close the app by clicking the stop icon
4. Please remove everything following `ui <-` and `server <-`

### Task 1: Loading the data

1. Set up a `SidebarLayout` with an empty `sidebarPanel`,  
and a `tableOutput` in its `mainPanel`
2. Load the data using `read.csv`, and  
output the `head` of the table with `renderTable`

### Task 2: Basic plotting

1. Replace the above `tableOutput` with a `plotOutput`
2. Render a scatter plot of variables  
`Body_Count` (x-axis) vs. `IMDB_Rating` (y-axis)

### Task 3: Reactive plotting

1. In the `sidebarPanel`, create 2 `selectInput`s  
that enable the user to select which variables to plot
2. Modify `renderPlot` to react to the currently selected variables

### Task 4: Subsetting

1. Add a `sliderInput` with range [0, 1000]
2. Modify `renderPlot` to plot only the subset of data  
for which the `Body_Count` lies in the specified range
3. Add a `textOutput` that prints the number of points  
that fall into the current range

### Task 5: Using `reactive()`

1. Create reactive value to store the current subset  
of the data using `subset <- reactive()`
2. Modify `renderPlot` and `renderText` to use this reactive value