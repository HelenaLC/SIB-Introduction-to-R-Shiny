# SIB - Introduction to R Shiny
**Instructors:** Phil Cheng & Helena Crowell  
**Time:** May 9th, 2019; 9:00-17:00  
**Location:** University of Zurich, Campus Irchel; seminar room Y32-E-06

### Install required packages

You will require only the few following R packages, and we kindly ask you to assure they are installed using the following commands:

```
pkgs <- c("shiny", "dplyr", "DT", "ggplot2")
pkgs <- setdiff(pkgs, rownames(installed.packages()))
if (length(pkgs) != 0) install.packages(pkgs)
```

### Download course material

At the moment, this repository contains everything we'll require for Monday (data sets, script skeletons). We will upload all presented material (scripts, slides, and solutions) here after the course.

If you're familiar with GitHub, you can clone this repository to your local machine via
```
git clone https://github.com/HelenaLC/SIB-Shiny-intro.git
```

Alternatively, you can download the repository by clicking on **Clone or download** > **Download ZIP**.

### Important notes

- For collaborative note-taking, we have set up an **Etherpad** [here](http://bit.ly/2vrl4pr) where you can share snippets of code, feedback, or questions at any time during the course. We hope to discuss issues that arise here *on the fly*, and that this will encourage live-discussion / feedback by breaking the barrier of having to raise your hand ;)

- Before lunch time, we will hand out red and green **sticky notes**. Please take a minute to write one positive thing on the green sticky note (e.g., something useful you've learned or something you liked about the teaching-style), and something you found too fast /  too slow / confusing / irrelevant, or questions that haven't yet been answered on the red one.

### Couse material

#### Contents

`scripts/...`  

<div class = "row">
<div class = "col-md-4">

- `0-introduction.Rmd`:  
    - what is Shiny?
    - app components & organization
    - basic layouts
    - input & output widgets
    - reactivity basics
- `1-moviesapp.Rmd`:  
    - step-by-step app building
    - 1st taskset with solutions
- `2-moreshiny.Rmd`:  
    - more reactivity
    - `tabsetPanel`s
</div>
<div class = "col-md-4">
- `3-moviesapp.Rmd`:  
    - continuation of movies app
    - 2nd taskset with solutions
- `4-conclusion.Rmd`:  
    - debugging, Shiny `reactlog`
    - app sharing & deployment

`exercises/...`  

- `movies2.1_actionButton.R`,  
  `movies2.1_tabsetPanel.R`,  
  `movies2.1_final.R`:  
    - solutions to app examples from `scripts/2-moreshiny.Rmd`

</div>
</div>

#### Instructions

- install required packages via

```
pkgs <- c("learnr", "shinydashboard", "shinyBS")
pkgs <- setdiff(pkgs, rownames(installed.packages()))
if (length(pkgs) != 0) install.packages(pkgs)
```

- open `.Rmd` in RStudio
- click on `Run Document`

***

## Overview

Shiny is an open-source R package that allows building interactive web applications from R, and without knowledge of web-development, enabling data scientists to make their data or analysis interactively explorable and accessible to colleagues, end-users, and/or for publication.

In this course, we will introduce the R Shiny framework, and equip R programmers with the basic tools to build and deploy their own web apps.

# Audience

Biologists, bioinformaticians, and any R users who are interested in developing an interactive web application to communicate their data or analysis to other non-programmers.

# Learning objectives

Upon completion of this course, attendees should have become familiar with:

- The general Shiny framework structure (server and UI).
- Basic Shiny building blocks (input and output widgets).
- An overview of UI layouts and how to “prettify” apps.
- The concepts of reactivity and reactive values (interactive vs. static).
- How to share their apps privately or deploy them publicly.

# Prerequisites

*Knowledge / competencies*

- Intermediate to advanced knowledge of R.
- No prior experience with Shiny is expected.

*Technical*

- You are required to bring your personal laptop with WIFI connection enabled and the latest versions of R and RStudio installed.

# Venue & Time

- University of Zurich, Campus Irchel:  
seminar room Y32-E-06
- May 6th, 2019: 9:00 - 17:00

# Instructors

- Phil Cheng, University Hospital Zurich, Levesque group (author of the [TCGA Browser](http://tcgabrowser.ethz.ch:3838/PROD))
- Helena L. Crowell, PhD student, Robinson group, UZH (author of the [CATALYST package and CATALYSTLite](http://catalyst-project.github.io/))