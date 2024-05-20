use <../../modules/translate_hull_each.scad>

$fn = 100;

width = 44.4;
radius = 30;

difference() {
  translate([0, -4, 10 - radius]) {
    linear_extrude(height = radius) square([width, 32]);

    translate([-3, 0, radius]) cube([width + 8, 25, 1]);
    translate([0, 25, radius]) cube([width, 7, 1]);
  }

  translate([20.5, 10, 10 - radius + 1.1]) translate_hull_each([0, 8])
    cylinder(d = 7, h = radius);

  translate([-0.1, 0, -radius]) rotate([0, 90]) cylinder(r = radius, h = width + 0.2);
}
