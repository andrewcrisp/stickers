# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Sticker profitability"),

  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("PricePoint",
                  "Price Point:",
                  min = 1,
                  max = 50,
                  value = 12),
      sliderInput("PriceOfInkPerOrder",
                  "Price of Ink per order:",
                  min = 0.01,
                  max = 2,
                  value = 0.5,
                  step = .01),
      sliderInput("PriceOfPaperPerOrder",
                  "Price of paper per order:",
                  min = 0.01,
                  max = 2,
                  value = 0.5,
                  step = .01),
      sliderInput("PriceOfPackagingPerOrder",
                  "Price of packaging per order:",
                  min = 0.01,
                  max = 2,
                  value = 0.5,
                  step = .01),
      sliderInput("PriceOfShippingPerOrder",
                  "Price of Shipping per order:",
                  min = 0.5,
                  max = 5,
                  value = 1.5,
                  step = .5),
      sliderInput("PriceOfLaminatorPerOrder",
                  "Price of laminating per order:",
                  min = 0.01,
                  max = 2,
                  value = 0.5,
                  step = .01),
      sliderInput("PrinterCost",
                  "Price of printer:",
                  min = 0,
                  max = 10000,
                  value = 900,
                  step = 100),
      sliderInput("CutterCost",
                  "Cost of Cutter:",
                  min = 0,
                  max = 10000,
                  value = 600,
                  step = 100),
      sliderInput("LaminatorCost",
                  "Cost of Laminator:",
                  min = 0,
                  max = 10000,
                  value = 200,
                  step = 100),
      sliderInput("StorefrontTransactionPercentage",
                  "Percent of sale to the storefront:",
                  min = 1,
                  max = 20,
                  value = 6.5,
                  step = .1)
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("pricePlot"),
      tableOutput("Netperorder")
    )
  )
)
