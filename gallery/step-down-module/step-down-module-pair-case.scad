use <../../modules/superellipse.scad>

$fn = 100;

translate([0, 0, -2]) linear_extrude(height = 2)
  superellipse(ra = 27, rb = 34, n = 8);

linear_extrude(height = 7) wall_shape();

linear_extrude(height = 22) difference() {
  wall_shape();

  translate([-50, -27]) square([100, 27 * 2]);
  translate([0, 30]) circle(d = 2.8);
  translate([0, -30]) circle(d = 2.8);
}

module screw_support(height = 7, hole = 2.8, thickness = 5)
  linear_extrude(height = height) difference() {
    circle(d = hole + thickness);
    circle(d = hole);
}

module support_pair() {
  translate([-15.5, 8]) screw_support();
  translate([15.5, -8]) screw_support();
}

module wall_shape() difference() {
  superellipse(ra = 27, rb = 34, n = 8);
  superellipse(ra = 25, rb = 27, n = 8);
}

translate([0, -12]) support_pair();
translate([0, 12]) support_pair();
