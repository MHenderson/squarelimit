library(here)
library(svgparser)

fish_grob <- read_svg(here("fish.svg"))

png(here("plots", "fish-grob.png"))
grid::grid.draw(fish_grob)
dev.off()