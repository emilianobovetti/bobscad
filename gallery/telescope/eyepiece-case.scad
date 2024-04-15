use <../../modules/squircle.scad>
use <../../modules/extrude_x.scad>

$fn = 100;

tolerance = 0.5;

difference() {
  translate([-21, 0, 24])
    rotate([0, 90])
    linear_extrude(height = 42)
    scale([1.2, 1])
    squircle(r = 23, n = 5);

  t = tolerance;

  union() {
    extrude_x(25) cylinder(d = 31.7 + t, h = 22.4 + 0.1);

    translate([0, 0, 22.4]) {
      extrude_x(25) cylinder(d = 33.7 + t, h = 17.5 + 0.1);

      extrude_x(25) translate([0, 0, 17.5]) hull() {
        cylinder(d = 33.7 + t, h = 0.01);
        translate([0, 0, 6.4]) cylinder(d = 38.3 + t, h = 0.01);
      }
    }
  }

  translate([-50 / 2, 0, 22]) rotate([0, 90]) cylinder(d = 28, h = 20);
}
