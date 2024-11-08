$fn = 100;

inner_diameter = 31.5;
handle_thickness = 4;

module cap() {
  cylinder(d = 39, h = 6);
  translate([0, 0, 6]) cylinder(d = inner_diameter, h = 17);
}

module handle_shape() difference() {
  d = inner_diameter - 2;
  t = handle_thickness;

  scale([1, 1, 1.5]) sphere(d = d);
  translate([-d / 2, -d / 2, -d]) cube(d);
  translate([-t / 2, -d / 2]) cube([t, d, d]);
}

difference() {
  cap();
  translate([0, 0, -0.1]) handle_shape();
}
