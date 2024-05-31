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
}

copy_mirror([0, 1]) translate([-20.25, 36.46, 5]) rotate([90, 0]) linear_extrude(height = 10) difference() {
  translate([-5, -5]) square([10, height]);
  translate([0, height / 2 - 4.7]) circle(d = 4.7);
}

translate([15, 0]) copy_mirror([0, 1]) difference() {
  cube([7, 31.46 + thickness, height]);

  translate([1.5, -0.1, 2]) cube([4, 31 + 0.1, height + 0.1]);
}
