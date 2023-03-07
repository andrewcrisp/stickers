library(dplyr)
library(ggplot2)
unitsSold <- tibble(units = seq(0,1000,10))


PricePoint <- 12
PrinterCost <- 500
CutterCost <- 500
LaminatorCost <- 500
UnitsPerInkCartridge <- 100
PriceOfInkCartridge <- 150
LengthOfPaperRollFeet <- 30
PriceOfPaperRoll <- 150
LengthPerOrderInches <- 16
PriceOfPaper <- 200

debt_function <- function(unitCount) {
  PrinterCost + CutterCost + LaminatorCost +
    PriceOfInkCartridge * (ceiling(unitCount / UnitsPerInkCartridge)) +
    PriceOfPaper * (ceiling(LengthPerOrderInches * 12) / LengthOfPaperRollFeet)
}
unitsSold <- unitsSold %>% 
  mutate(totalCost = debt_function(units)) %>% 
  mutate(grossSales = PricePoint  * units) %>% 
  mutate(net = grossSales - totalCost) %>% 
  mutate(netPerUnit = net / units)


unitsSold %>% ggplot(aes(x = units, y = net)) +
  geom_line()
