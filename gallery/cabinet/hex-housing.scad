include <./parameters.scad>

module hex_housing(screw_len = 12, hex_size = 6.3, hex_t = hex_thickness, height = 4)
  translate([screw_len - hex_t - 0.001, 0]) rotate([90, 0, 90]) {
    linear_extrude(height = hex_t) hull() {
      circle(d = hex_size, $fn = 6);
      translate([0, height]) circle(d = hex_size, $fn = 6);
    }

    translate([0, height, -screw_len]) cylinder(d = screw_diameter, h = screw_len + 0.001);
  }
