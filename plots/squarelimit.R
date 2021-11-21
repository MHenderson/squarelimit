library(funcgeo)
library(grid)
library(here)

t <- quartet(fish_p, fish_q, fish_r, fish_s)
u <- cycle(rot(fish_q))

nil <- nullGrob()

side1 <- quartet(nil, nil, rot(t), t)
side2 <- quartet(side1, side1, rot(t), t)

corner1 <- quartet(nil, nil, nil, u)
corner2 <- quartet(corner1, side1, rot(side1), u)

corner <- nonet(
  corner2, side2, side2,
  rot(side2), u, rot(t),
  rot(side2), rot(t), rot(fish_q)
)

squarelimit <- cycle(corner)

png(here("plots", "squarelimit.png"))
plot(squarelimit)
dev.off()
