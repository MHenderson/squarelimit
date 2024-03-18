library(funcgeo)
library(here)
library(svgparser)

fish <- read_svg(here("fish.svg"))

fish_above_fish <- above(fish, fish)

png(here("plots", "fish-grob.png"))
grid::grid.draw(fish_above_fish)
dev.off()
