difference() {
  cylinder(d = 25, h = 7.5, $fn = 24);
  translate([0, 0, -0.1]) cylinder(d = 10 + 0.4, h = 7.5 + 0.2, $fn = 6);
}
