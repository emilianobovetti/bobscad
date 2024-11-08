include <./parameters.scad>

head_d = 5.1;
head_h = 3;

module screw_hole(flip = 0) mirror([0, 0, flip]) translate([0, 0, -0.01]) {
  cylinder(d = head_d, h = head_h);
  cylinder(d = screw_diameter, h = 100);
}
