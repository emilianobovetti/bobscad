module line(length = 1000, angle = 0, thickness = 0.1) rotate(angle) hull() {
  offset = length / 2;
  rad = thickness / 2;

  translate([-offset, 0]) circle(r = rad);
  translate([offset, 0]) circle(r = rad);
}
