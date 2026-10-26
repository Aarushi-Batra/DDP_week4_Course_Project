# v2 - server: train a classifier once, classify whatever the user types
library(shiny)
library(ggplot2)
library(MASS)

model <- lda(Species ~ ., data = iris)

shinyServer(function(input, output) {

  flower <- reactive({
    data.frame(Sepal.Length = input$sl, Sepal.Width = input$sw,
               Petal.Length = input$pl, Petal.Width = input$pw)
  })

  guess <- reactive(predict(model, flower()))

  output$species <- renderText({
    paste("Looks like:", as.character(guess()$class))
  })

  output$probs <- renderTable({
    p <- guess()$posterior[1, ]
    data.frame(Species = names(p), Confidence = paste0(round(100 * p, 1), "%"))
  })

  output$plot <- renderPlot({
    me <- flower()
    ggplot(iris, aes(.data[[input$xaxis]], .data[[input$yaxis]], colour = Species)) +
      geom_point(size = 2, alpha = 0.7) +
      geom_point(data = me, colour = "black", shape = 18, size = 6) +
      theme_minimal(base_size = 14)
  })
})
