#library(funcgeo)
library(here)
library(svgparser)

fish <- read_svg(here("fish.svg"))

#fish_above_fish_1 <- above(fish, fish)

# rotation works for gTree
#fish_above_fish_2 <- editGrob(fish, vp = viewport(angle=80))
# for translation, I think we have to move the viewport, not the grob
#fish_above_fish_3 <- editGrob(fish_above_fish_2, vp = viewport(x = fish_above_fish_2$vp$x - grid::unit(0.5, "npc")))

rot <- function(g, angle = 90) {
  grid::editGrob(g, vp = grid::viewport(
    angle  = ifelse(is.null(g$vp$angle), angle, g$vp$angle + angle))
  )
}

# this is not what we're after
# found here: https://stat.ethz.ch/pipermail/r-help//2012-May/313608.html
flip <- function(g) {
  grid::editGrob(g, vp = grid::viewport(angle = 180, y = grid::unit(0.5, "npc") - grid::unit(1, "line")))
}

png(here("plots", "fish-grob.png"))
grid::grid.draw(fish)
# we have to give the fish a viewport to start with
fish <- grid::editGrob(fish, vp = grid::viewport())
grid::grid.draw(flip(fish))
dev.off()
