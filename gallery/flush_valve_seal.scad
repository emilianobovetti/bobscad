$fn = 100;

// height = 3.5
// outer_diameter = 55
// inner_diameter = 26

linear_extrude(height = 3.5) difference() {
  circle(d = 55);
  circle(d = 26);
}
