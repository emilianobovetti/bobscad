$fn = 100;

difference() {
  union() {
    cylinder(d = 53, h = 0.8);
    cylinder(d = 35.85 + 2, h = 6);
  }

  translate([0, 0, -0.1]) {
    cylinder(d = 35.85 + 0.1, h = 10);
    cylinder(d = 35.85 + 0.4, h = 2);
  }
}
