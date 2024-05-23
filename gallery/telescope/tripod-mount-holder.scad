use <../../modules/copy_mirror.scad>
use <../../modules/chord.scad>

$fn = 100;

thickness = 5;
height = 40;

linear_extrude(height = height) copy_mirror([0, 1]) translate([0, 31.46]) {
  translate([0, 1]) chord(l = 22, h = 2.5, t = thickness);

  copy_mirror([1, 0]) translate([22 / 2, 0]) hull() {
    translate([0, 1]) rotate(67) square([thickness, 0.1]);
    translate([1.5, -0.8]) square([0.1, 0.1]);
    translate([3.25, -0.8]) square([1, 0.8 + thickness]);
  }

  translate([-20.25, -19]) square([thickness, 19 + thickness]);
}

translate([15, 0]) copy_mirror([0, 1]) difference() {
  cube([7, 31.46 + thickness, height]);

  translate([1.5, -0.1, 2]) cube([4, 31 + 0.1, height + 0.1]);
}
