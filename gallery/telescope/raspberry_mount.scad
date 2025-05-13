use <../../modules/squared_circle.scad>

$fn = 100;

height = 138;
width = 150;

linear_extrude(height = 3) difference() {
  squared_circle([width, height], r = 2);

  translate([33, 8]) vrm_mounting_holes();
  translate([33, 76]) vrm_mounting_holes();

  translate([width - 58 - 10, (height - 49) / 2]) {
    translate([0, 72]) circle(d = 2.8);
    raspberry_pi_5_mounting_holes();
  }
}

module vrm_mounting_holes() {
  circle(d = 5.8);
  translate([0, 54]) circle(d = 5.8);
}

module raspberry_pi_5_mounting_holes() {
  circle(d = 2.8);
  translate([0, 49]) circle(d = 2.8);
  translate([58, 0]) circle(d = 2.8);
  translate([58, 49]) circle(d = 2.8);
}
