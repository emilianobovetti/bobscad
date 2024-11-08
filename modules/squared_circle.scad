module squared_circle(size, r = 2^-52, center = false) {
  x = is_num(size) ? size : size.x;
  y = is_num(size) ? size : size.y;

  assert(x > 0, "squared_circle x size must be positive");
  assert(y > 0, "squared_circle y size must be positive");
  assert(r > 0, "squared_circle r argument must be positive");
  assert(2 * r <= min(x, y), "squared_circle r argument is too large");
  assert(is_bool(center), "squared_circle center argument must be a boolean");

  translate(center ? [-x / 2, -y / 2] : [0, 0]) hull() {
    translate([r, r]) circle(r = r);
    translate([x - r, r]) circle(r = r);
    translate([x - r, y - r]) circle(r = r);
    translate([r, y - r]) circle(r = r);
  }
}
