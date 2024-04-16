use <../../modules/superellipse.scad>
use <../../modules/extrude_x.scad>

$fn = 100;

horizontal_tolerance = 0.5;
vertical_tolerance = 0.4;
mounting_flange_height = 22;
body_height = 17.1;

difference() {
  translate([-21, 0, 24])
    rotate([0, 90])
    linear_extrude(height = 42)
    superellipse(ra = 28, rb = 23, n = 5);

  ht = horizontal_tolerance;
  vt = vertical_tolerance;
  mfh = mounting_flange_height + vt;
  bh = body_height + vt;

  union() {
    extrude_x(25) cylinder(d = 31.7 + ht, h = mfh + 0.1);

    translate([0, 0, mfh]) {
      extrude_x(25) cylinder(d = 33.7 + ht, h = bh + 0.1);

      extrude_x(25) translate([0, 0, bh]) hull() {
        cylinder(d = 33.7 + ht, h = 0.01);
        translate([0, 0, 6.4]) cylinder(d = 38.3 + ht, h = 0.01);
      }
    }
  }

  translate([-50 / 2, 0, 22]) rotate([0, 90]) cylinder(d = 28, h = 20);
}
