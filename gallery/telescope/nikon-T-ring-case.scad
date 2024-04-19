use <../../modules/squircle.scad>
use <../../modules/superellipse.scad>
use <../../modules/translate-hull-each.scad>

$fn = 100;

tolerance = 0.2;

base_diameter = 55;
adapter_height = 9.6 + 4.2;

case_height = adapter_height + 4;
case_diameter = base_diameter + 4;



difference() {
  linear_extrude(height = case_height) squircle(r = case_diameter / 2, n = 25);

  translate([0, 0, (case_height - adapter_height) / 2]) translate_hull_each([40, 0]) {
    cylinder(d = base_diameter + tolerance, h = 9.6);
    translate([0, 0, 9.6 - 0.1]) cylinder(d = 45.5 + tolerance, h = 4.2 + 0.1);
  }

  translate([-case_diameter / 2 - 0.1, 0, case_height / 2])
    rotate([0, 90]) linear_extrude(height = 10)
    superellipse(ra = adapter_height / 2 + 0.1, rb = 11, n = 8);
}
