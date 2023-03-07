# Define server logic required to draw a histogram
server <- function(input, output) {
  library(dplyr)
  library(ggplot2)
  unitsSold <- tibble(units = seq(0,1000,10))
  
  output$pricePlot <- renderPlot({
    debt_function <- function(unitCount) {
      input$PrinterCost + input$CutterCost + input$LaminatorCost +
        (input$NumberOfInkCartridges * (input$PriceOfInkCartridge * (ceiling(unitCount / input$UnitsPerInkCartridge)))) +
        (input$PriceOfPaper * (ceiling(input$LengthPerOrderInches * 12) / input$LengthOfPaperRollFeet)) +
        (input$LaminatorRollCost * (ceiling((input$LengthPerOrderInches + input$LaminatorSheetMarginInch) * 12) / input$LengthOfLamnatorRollFeet)) +
        (input$StorefrontTransactionPercentage * .01 * unitCount)
    }
    
    unitsSold <- unitsSold %>% 
      mutate(totalCost = debt_function(units)) %>% 
      mutate(grossSales = input$PricePoint  * units) %>% 
      mutate(net = grossSales - totalCost) %>% 
      mutate(netPerUnit = net / units)
    
    unitsSold %>% ggplot(aes(x = units, y = net)) +
      geom_line() +
      geom_hline(aes(yintercept=0), color = "red") 
      #geom_line(aes(x = units, y = totalCost), color = "gray") +
      #geom_line(aes(x = units, y = grossSales), color = "green")
    
  })
  
}

# input$PrinterCost
# input$CutterCost
# input$LaminatorCost
# input$UnitsPerInkCartridge
# input$PriceOfInkCartridge
# input$LengthOfPaperRollFeet
# input$PriceOfPaper
# input$LengthPerOrderInches
#input$LengthOfLamnatorRollFeet
#input$LaminatorRollCost