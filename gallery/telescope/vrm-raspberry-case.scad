use <../../modules/superellipse.scad>

$fn = 100;

height = 70;
width = 150;

translate([width / 2, 0, -0.8]) linear_extrude(height = 0.8)
  superellipse(ra = width / 2, rb = height / 2, n = 8);

linear_extrude(height = 11) difference() {
  translate([width / 2, 0]) superellipse(ra = width / 2, rb = height / 2, n = 8);

  translate([18, 0]) step_down_module_mounting_holes();
  translate([42, 0]) step_down_module_mounting_holes();
  translate([94, 0]) raspberry_pi_5_mounting_holes();
}

module step_down_module_mounting_holes() {
  translate([-8, -15.5]) circle(d = 2.8);
  translate([8, 15.5]) circle(d = 2.8);
}

module raspberry_pi_5_mounting_holes() {
  translate([29, 24.5]) circle(d = 2.8);
  translate([29, -24.5]) circle(d = 2.8);
  translate([-29, 24.5]) circle(d = 2.8);
  translate([-29, -24.5]) circle(d = 2.8);
}
