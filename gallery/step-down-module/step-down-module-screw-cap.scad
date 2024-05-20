$fn = 100;

width = 9.7;
depth = 4.9;
base_thickness = 0.8;
wrapper_thickness = 0.4;

difference() {
  t = base_thickness;

  cube([width + t * 2, depth + t * 2, 2.6]);
  translate([1.5 + t, 1.5 + t, 0.6]) cylinder(d = 3, h = 2.1);
}

translate([base_thickness / 2, base_thickness / 2, 2.6]) difference() {
  t = wrapper_thickness;

  cube([width + t * 2, depth + t * 2, 3.2]);
  translate([t, t, -0.1]) cube([width, depth, 3.2 + 0.2]);
}
