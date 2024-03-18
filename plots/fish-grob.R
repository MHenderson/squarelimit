library(funcgeo)
library(here)
library(svgparser)

fish <- read_svg(here("fish.svg"))

fish_above_fish_1 <- above(fish, fish)

# rotation works for gTree
fish_above_fish_2 <- editGrob(fish, vp = viewport(angle=80))
# for translation, I think we have to move the viewport, not the grob
fish_above_fish_3 <- editGrob(fish_above_fish_2, vp = viewport(x = fish_above_fish_2$vp$x - grid::unit(0.5, "npc")))

png(here("plots", "fish-grob.png"))
grid::grid.draw(fish_above_fish_1)
grid::grid.draw(fish_above_fish_2)
grid::grid.draw(fish_above_fish_3)
dev.off()
