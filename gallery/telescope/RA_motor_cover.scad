use <../../modules/copy_translate.scad>
use <../../modules/copy_mirror.scad>

$fn = 100;

wall_thickness = 2;

difference() {
  // ref: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/FAQ#Why_are_some_parts_(e.g._holes)_of_the_model_not_rendered_correctly?
  render(convexity = 2) side_wall();

  translate([-7.1, 70, 51])
    rotate([0, 90])
    hull()
    copy_translate([0, 40])
    cylinder(r = 4, h = wall_thickness + 0.2);
}


translate([88 + wall_thickness, 0]) mirror([1, 0]) difference() {
  render(convexity = 2) side_wall();

  translate([-8, 77, 17.2]) rotate([0, 90]) cylinder(d = 15, h = 10);
}

front_wall();
translate([88 + wall_thickness, 0]) mirror([1, 0]) front_wall();

translate([0, 117 - 50, 1.4]) {
  side_rail(length = 50);
  translate([88 + wall_thickness, 0]) mirror([1, 0]) side_rail(length = 50);
}

translate([0, 117]) rear_wall();
translate([0, 0, 60]) top_wall();

module side_wall(t = wall_thickness) translate([-t / 2, 117])
  rotate([90, 0]) linear_extrude(height = 117) {
    side_wall_bottom_shape();
    side_wall_top_shape();
  };

module side_rail(length) {
  cube([3.5, length, 2]);
  translate([3.5, 0, 2 - 5]) cube([2, length, 5]);
}

module side_wall_bottom_shape(t = wall_thickness) {
  hull() copy_translate([0, 10]) square([t, t]);
  translate([0, -t]) hull() copy_translate([4.7, -4.7]) square([t, t]);
}

module side_wall_top_shape(t = wall_thickness) {
  translate([0, 10]) hull() copy_translate([-6, 5]) square([t, t]);
  translate([-6, 15]) hull() copy_translate([0, 40]) square([t, t]);
  translate([-6, 55]) hull() copy_translate([6, 5]) square([t, t]);
}

module rear_wall(t = wall_thickness) translate([-t / 2, t]) {
  rear_wall_transform() side_wall_bottom_shape();
  rear_wall_transform() side_wall_top_shape();
}

module rear_wall_transform(t = wall_thickness)
  translate([88 / 2 + t, 0])
  rotate([90, 0])
  linear_extrude(height = t)
  hull()
  copy_mirror([1, 0])
  translate([-88 / 2 - t, 0])
  children();

module top_wall(t = wall_thickness) translate([-t / 2, 0]) difference() {
  width = 88 + 2 * t;

  cube([width, 117, t]);
  translate([width / 2, -15.4, -0.1]) cylinder(r = 44, h = t + 0.2);
}

module front_wall(t = wall_thickness) translate([-t / 2, t]) hull() {
  rotate([90, 0]) linear_extrude(height = t) hull() side_wall_top_shape();
  translate([-5, 20, 15]) cube([0.1, 0.1, 40]);
}
