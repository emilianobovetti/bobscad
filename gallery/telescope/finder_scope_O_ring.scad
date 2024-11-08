$fn = 100;

inner_diameter = 32.8;
outer_diameter = 35.4;
height = 4;

linear_extrude(height = height) difference() {
  circle(d = outer_diameter);
  circle(d = inner_diameter);
}
