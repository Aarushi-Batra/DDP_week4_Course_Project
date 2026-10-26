Flower Guesser
========================================================
author: Aarushi Batra
date: October 24, 2026
autosize: true
transition: fade

Name an iris from four measurements.

What is it?
========================================================

A tiny Shiny app that **identifies an iris flower's species**.

- Type 4 measurements
- Get the species and a confidence for each guess
- See your flower on a chart among 150 real ones

Who needs it?
========================================================

- Students learning classification
- Gardeners with a ruler and a curious mind
- Anyone who wants to see machine learning in 10 seconds

*No data science background needed.*

The data and model
========================================================


``` r
library(MASS)
model <- lda(Species ~ ., data = iris)
table(predicted = predict(model)$class, actual = iris$Species)
```

```
            actual
predicted    setosa versicolor virginica
  setosa         50          0         0
  versicolor      0         48         1
  virginica       0          2        49
```

Training accuracy: **98%**

Try one flower, then use it
========================================================


``` r
flower <- data.frame(Sepal.Length = 5.8, Sepal.Width = 3.0,
                     Petal.Length = 4.3, Petal.Width = 1.3)
p <- predict(model, flower)
as.character(p$class)
```

```
[1] "versicolor"
```

``` r
round(p$posterior, 3)
```

```
  setosa versicolor virginica
1      0          1         0
```

- App: `https://Aarushi-Batra.shinyapps.io/flower-guesser/`
- Code: `https://github.com/Aarushi-Batra/DDP_week4_Course_Project`
- A **Help** tab inside the app explains every step
