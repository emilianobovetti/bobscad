use <./copy_mirror.scad>

$fn = 100;

module dovetail(min_width = 1, max_width = 5, r1 = 1, r2 = 1, angle = 45) copy_mirror([1, 0]) {
  x1 = r2 * (1 - sin(angle)) + (min_width / 2);
  y1 = r2 * (1 + cos(angle));
  x2 = (max_width / 2 - x1 - r1) / cos(angle) + ((r1 * sin(angle)) / cos(angle));
  h1 = r1 + x2 * sin(angle) + r1 * cos(angle);

  translate([x1, y1]) hull() {
    translate([x2 * cos(angle) - r1 * sin(angle), x2 * sin(angle) + r1 * cos(angle)]) circle(r = r1);
    square([0.001, h1]);
  }

  translate([0, y1]) square([x1, h1]);

  difference() {
    square([x1 + r2 * sin(angle), y1]);
    translate([r2 * sin(angle) + x1, y1 - r2 * cos(angle)]) circle(r = r2);
  }
}
