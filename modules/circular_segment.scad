module circular_segment(l, h) {
  r = (l^2) / (8*h) + h / 2;

  translate([0, h - r]) difference() {
    circle(r = r);
    translate([-r, -r - h]) square([2*r, 2*r]);
  }
}
