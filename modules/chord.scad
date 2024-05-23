use <./isosceles.scad>

module chord(l, h, t = 1) {
  r = (l^2) / (8*h) + h / 2;
  angle = 2 * asin(l / (2*r));

  translate([0, h - r]) rotate(90 - angle/2) intersection() {
    difference() {
      circle(r = r + t);
      circle(r = r);
    }

    // TODO: handle angles >= 180
    isosceles(height = r + t, vertex_angle = angle);
  }
}
