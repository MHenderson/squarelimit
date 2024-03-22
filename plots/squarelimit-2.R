library(funcgeo)
library(grid)
library(here)
library(svgparser)

# hacking with these offsets is probably not the right approach
#fish <- read_svg(here("fish.svg"), xoffset = -0.074, yoffset = 0.01,)
fish <- read_svg(here("fish.svg"), xoffset = 0, yoffset = 0, default.units = "mm")
# are there pieces missing?
fish <- getGrob(fish, "GRID.pathgrob.1")

fliprot45 <- function(x) {
  flip(rot(x, 45))
}

nil <- nullGrob()

fish2 <- flip(rot(fish))
fish3 <- rot(rot(rot(fish2)))

over <- function(p, q) {
  fg <- grid::frameGrob(layout = grid::grid.layout(1, 1))
  fg <- grid::packGrob(fg, p, row = 1)
  fg <- grid::packGrob(fg, q, row = 1)
  return(fg)
}

t <- over(fish, above(fish2, fish3))
#u <- over(over(fish2, rot(fish2)), over(rot(rot(fish2)), rot(rot(rot(fish2)))))

#side1 <- quartet(nil, nil, rot(t), t)
#side2 <- quartet(side1, side1, rot(t), t)

#corner1 <- quartet(nil, nil, nil, u)
#corner2 <- quartet(corner1, side1, rot(side1), u)

png(here("plots", "squarelimit-2.png"))
grid.rect(x = unit(85, "mm"), y = unit(85, "mm"), width = unit(170, "mm"), height = unit(170, "mm"))
grid.draw(over(fish, rot(rot(fish))))
dev.off()