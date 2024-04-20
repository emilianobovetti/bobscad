use <../modules/superellipse.scad>

$fn = 100;

translate([0, 0, -1]) linear_extrude(height = 1)
  superellipse(ra = 25, rb = 13, n = 8);

linear_extrude(height = 20) difference() {
  superellipse(ra = 25, rb = 13, n = 8);
  superellipse(ra = 24, rb = 12, n = 8);

  translate([-25.1, -1.5]) square([2, 3]);
  translate([25.1 - 2, -2.5]) square([2, 5]);
}

module screw_support(height = 7, hole = 3, thickness = 5)
  linear_extrude(height = height) difference() {
    circle(d = hole + thickness);
    circle(d = hole);
}

translate([-15.5, 8]) screw_support();
translate([15.5, -8]) screw_support();
