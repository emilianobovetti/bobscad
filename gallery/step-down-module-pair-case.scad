use <../modules/superellipse.scad>

$fn = 100;

translate([0, 0, -3]) linear_extrude(height = 3)
  superellipse(ra = 25, rb = 34, n = 8);

linear_extrude(height = 20) difference() {
  superellipse(ra = 25, rb = 34, n = 8);

  superellipse(ra = 40, rb = 27, n = 8);
  translate([0, 30]) circle(d = 3);
  translate([0, -30]) circle(d = 3);
}

module screw_support(height = 5, hole = 3, thickness = 5)
  linear_extrude(height = height) difference() {
    circle(d = hole + thickness);
    circle(d = hole);
}

module support_pair() {
  translate([-15.5, 8]) screw_support();
  translate([15.5, -8]) screw_support();
}

translate([0, -12]) support_pair();
translate([0, 12]) support_pair();
