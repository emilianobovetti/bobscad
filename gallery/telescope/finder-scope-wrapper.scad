$fn = 100;

inner_diameter = 32.2;
outer_diameter = inner_diameter + 2;
height = 12;

linear_extrude(height = height) difference() {
  circle(d = outer_diameter);
  circle(d = inner_diameter);
}

translate([0, 0, height / 2])
  rotate_extrude()
  translate([inner_diameter / 2, 0])
  circle(d = 1);
