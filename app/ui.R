# v2 - Flower Guesser: type in petal/sepal sizes, get the likely iris species
library(shiny)

shinyUI(navbarPage("Flower Guesser", theme = bslib::bs_theme(bootswatch = "minty"),

  tabPanel("Guess",
    fluidRow(
      column(4, wellPanel(
        numericInput("sl", "Sepal length (cm)", value = 5.8, min = 4, max = 8, step = 0.1),
        numericInput("sw", "Sepal width (cm)",  value = 3.0, min = 2, max = 4.5, step = 0.1),
        numericInput("pl", "Petal length (cm)", value = 4.3, min = 1, max = 7, step = 0.1),
        numericInput("pw", "Petal width (cm)",  value = 1.3, min = 0.1, max = 2.6, step = 0.1),
        selectInput("xaxis", "Chart x-axis:", c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width")),
        selectInput("yaxis", "Chart y-axis:", c("Petal.Width", "Petal.Length", "Sepal.Length", "Sepal.Width"))
      )),
      column(8,
        h2(textOutput("species")),
        tableOutput("probs"),
        plotOutput("plot", height = "320px")
      )
    )
  ),

  tabPanel("Help",
    h3("What is this?"),
    p("Enter the measurements of an iris flower and the app guesses which of the three
       species it is: ", em("setosa"), ", ", em("versicolor"), " or ", em("virginica"), "."),
    h4("Steps"),
    tags$ol(
      tags$li("Type the four measurements in centimetres (or use the arrows in each box)."),
      tags$li("The species name at the top updates automatically."),
      tags$li("The table shows how confident the guess is for each species."),
      tags$li("Pick different axes to see where your flower (black diamond) sits among the real ones.")
    ),
    h4("Behind the scenes"),
    p("A model (linear discriminant analysis) was trained on R's built-in ", code("iris"),
      " data: 150 flowers, 50 per species. Tip: setosa has very small petals; virginica has the biggest.")
  )
))
