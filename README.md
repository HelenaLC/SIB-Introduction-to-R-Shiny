# SIB Introductory course to R Shiny
**date, Zurich - taught by Phil Cheng & Helena Crowell**


### Objectives

...

### Contents

* Inputs & outputs
    * fileInput, textInput, numericInput, selectInput, actionButton
    * textOutput, plotOutput, tableOutput, dataTableOutput
  
* Layouts & styling
    * [`shinydashboard`](https://rstudio.github.io/shinydashboard) for dashboard layouts
    * [`shinyBS`](https://ebailey78.github.io/shinyBS) for Bootstrap components

* Rendering 
    * `renderX()` to generate outputs
    * `reactive()`, `eventReactive()` (example button click)
    
* Some advances stuff
    * brushing points
    * `DT` table selection

### Data

- The **Affairs dataset** from 1978 contains information about politicians having affairs. The goal of the dataset is to find characteristics that make it more plausable for a politician to have an affair. Does the number of children matter? How religious the politician is? Or education/marriage rating?  
*[reference: Fair, R. (1977) “A note on the computation of the tobit estimator”, Econometrica, **45**, 1723-1727]*

- **Movies data set** originates from a forum where users collect on-screen body counts for a selection of films and the characters and actors who appear in these films. To be counted a kill and/or dead body has to be visible on the screen, implied deaths like those died in the explosion of the Death Star are not counted. The dataset currently contains counts for 545 films from 1949 to 2013.  
*[source: http://www.moviebodycounts.com]*

### Resources

* Both video and written tutorials are available at https://shiny.rstudio.com/tutorial.

### Examples

* An impressive example of what is possible with Shiny is [iSEE](https://bioconductor.org/packages/release/bioc/html/iSEE.html).