use <../../modules/copy_translate.scad>
use <../../modules/copy_mirror.scad>

$fn = 100;

wall_thickness = 2;

side_wall();
translate([88 + wall_thickness, 0]) mirror([1, 0]) difference() {
  // ref: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/FAQ#Why_are_some_parts_(e.g._holes)_of_the_model_not_rendered_correctly?
  render(convexity = 2) side_wall();
  translate([-20, 85, 25]) rotate([0, 90]) cylinder(d = 25, h = 20);
}

translate([0, 119]) rear_wall();
translate([0, 0, 60]) top_wall();

module side_wall(t = wall_thickness) translate([-t / 2, 119])
  rotate([90, 0]) linear_extrude(height = 119) {
    side_wall_bottom_shape();
    side_wall_top_shape();
  };

module side_wall_bottom_shape(t = wall_thickness) {
  hull() copy_translate([0, 10]) square([t, t]);
  translate([0, -t]) hull() copy_translate([5, -t - 4.5]) square([t, t]);
}

module side_wall_top_shape(t = wall_thickness) {
  translate([0, 10]) hull() copy_translate([-12, 5]) square([t, t]);
  translate([-12, 15]) hull() copy_translate([0, 40]) square([t, t]);
  translate([-12, 55]) hull() copy_translate([12, 5]) square([t, t]);
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

  cube([width, 119, t]);
  translate([width / 2, -11.5, -0.1]) cylinder(r = 44, h = t + 0.2);
}
