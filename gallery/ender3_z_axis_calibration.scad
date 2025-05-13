use <../modules/squared_circle.scad>
use <../modules/copy_translate.scad>

$fn = 100;

difference() {
  translate([0, -10])
    linear_extrude(height = 9.3)
    squared_circle([25, 20], r = 1);
  // cylinder(d = 20, h = 9.3);

  translate([0, 0, -1]) hull() copy_translate([14, 0]) {
    cylinder(d = 5.2, h = 11);
  }
}
