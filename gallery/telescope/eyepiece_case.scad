use <../../modules/superellipse.scad>
use <../../modules/translate_hull_each.scad>

$fn = 100;

horizontal_tolerance = 0.5;
vertical_tolerance = 0.4;
mounting_flange_height = 22;
// body_height = 17.1;
body_height = 30;
rubber_eyecap_height = 6.4;

difference() {
  ht = horizontal_tolerance;
  vt = vertical_tolerance;

  mfh = mounting_flange_height + vt;
  bh = body_height + vt;
  reh = rubber_eyecap_height;
  eyepiece_height = mfh + bh + reh;
  ehh = eyepiece_height / 2;

  translate([-21, 0, 1 + ehh])
    rotate([0, 90])
    linear_extrude(height = 42)
    superellipse(ra = 6 + ehh, rb = 23, n = 5);

  translate_hull_each([25, 0]) {
    cylinder(d = 31.7 + ht, h = mfh + 0.1);

    translate([0, 0, mfh]) cylinder(d = 33.7 + ht, h = bh + 0.1);

    translate([0, 0, mfh + bh]) hull() {
      cylinder(d = 33.7 + ht, h = 0.01);
      translate([0, 0, reh]) cylinder(d = 38.3 + ht, h = 0.01);
    }
  }

  translate([-50 / 2, 0, ehh]) rotate([0, 90]) cylinder(d = 28, h = 20);
}
