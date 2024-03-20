#library(funcgeo)
library(here)
library(svgparser)

fish <- read_svg(here("fish.svg"))

# > fish$children[[1]]$children[[1]]$name
# [1] "GRID.pathgrob.1"
# > grid::getGrob(fish, "GRID.pathgrob.1")
# pathgrob[GRID.pathgrob.1] 

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

flip <- function(g) {
  grid::editGrob(g, x = grid::unit(1, "npc") - g$x)
}

png(here("plots", "fish-grob.png"))
# grid::grid.draw(fish)
g1 <- grid::getGrob(fish, "GRID.pathgrob.1")
grid::grid.draw(g1)
grid::grid.draw(flip(g1))
dev.off()
