use <../../modules/superellipse.scad>

$fn = 200;

difference() {
  union() {
    linear_extrude(10) superellipse(ra = 120 / 2, rb = 90 / 2, n = 8);
    translate([0, 0, 10]) linear_extrude(10) superellipse(ra = (100 - 0.4) / 2, rb = (70 - 0.4) / 2, n = 8);
  }

  translate([0, 0, 10]) linear_extrude(11) superellipse(ra = (100 - 10) / 2, rb = (70 - 10) / 2, n = 8);
}
