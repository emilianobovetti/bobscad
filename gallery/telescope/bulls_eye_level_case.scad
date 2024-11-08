use <../../modules/squircle.scad>
use <../../modules/superellipse.scad>

$fn = 100;

tolerance = 0.1;
diameter = 60 + tolerance;
filter_height = 12 + tolerance;

case_height = filter_height + 4;
case_diameter = diameter + 4;

module filter_shape() cylinder(d = diameter, h = filter_height);

difference() {
  linear_extrude(height = case_height) squircle(r = case_diameter / 2, n = 10);

  translate([0, 0, (case_height - filter_height) / 2]) hull() {
    filter_shape();
    translate([case_diameter, 0]) filter_shape();
  }

  translate([-case_diameter / 2 - 0.1, 0, case_height / 2])
    rotate([0, 90]) linear_extrude(height = 6)
    superellipse(ra = filter_height / 2 + 0.1, rb = 13, n = 8);
}
