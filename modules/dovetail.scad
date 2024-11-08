use <./copy_mirror.scad>

module dovetail(min_width = 1, max_width = 5, r1 = 1, r2 = 1, angle = 45) copy_mirror([1, 0]) {
  assert(r1 * 4 <= max_width, "Invalid arguments: either decrease r1 or increase max_width");

  x1 = r2 * (1 - sin(angle)) + (min_width / 2);
  y1 = r2 * (1 + cos(angle));
  x2 = (max_width / 2 - x1 - r1) / cos(angle) + ((r1 * sin(angle)) / cos(angle));
  h1 = r1 + x2 * sin(angle) + r1 * cos(angle);

  x3 = x2 * cos(angle) - r1 * sin(angle);
  y3 = x2 * sin(angle) + r1 * cos(angle);

  base_width = x1 + r2 * sin(angle);

  assert(max_width / 2 >= base_width, "Invalid max_width, it should be increased to match base_width");

  translate([x1, y1]) hull() {
    translate([x3, y3]) circle(r = r1);
    square([0.001, h1 - r1]);
  }

  translate([0, y1]) square([x1, y3]);
  translate([0, y1 + y3]) square([x1 + x3, h1 - y3]);

  difference() {
    square([base_width, y1]);
    translate([r2 * sin(angle) + x1, y1 - r2 * cos(angle)]) circle(r = r2);
  }
}
