use <../modules/squared_circle.scad>
use <../modules/copy_translate.scad>

$fn = 100;

linear_extrude(height = 3) difference() {
  squared_circle([23, 24.5], r = 1);

  translate([5.5, 3.25]) circle(d = 2.8);
  translate([17, 3.25]) circle(d = 2.8);
  translate([17, 21.25]) circle(d = 2.8);
  translate([5.5, 21.25]) circle(d = 2.8);

  translate([16, 6.5]) squared_circle(11.5, r = 3);
  translate([-6, 6.5]) squared_circle(11.5, r = 3);
}
