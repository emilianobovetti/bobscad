use <../../modules/superellipse.scad>
use <../../modules/copy_mirror.scad>

$fn = 100;

linear_extrude(height = 2) difference() {
  superellipse(ra = 50, rb = 30, n = 8);

  translate([37.5, 0]) circle(d = 3.8);
  translate([-37.5, 0]) circle(d = 3.8);
}

copy_mirror([1, 0]) translate([37.5, 7]) bracket();
bracket();

module bracket() difference() {
  translate([-2.5, 0]) cube([5, 18, 43]);
  translate([-5, 9, 38]) rotate([0, 90]) cylinder(d = 4.8, h = 10);
}
