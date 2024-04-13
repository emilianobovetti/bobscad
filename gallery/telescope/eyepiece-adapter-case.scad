use <../../modules/lid.scad>

$fn = 100;

hole_diameter = 44.4;

difference() {
  lid(
    hole_diameter,
    edge_height = 85,
    inner_border = 1.5,
    base_height = 3,
    edge_thickness = 10
  );

  side_hole_depth = 8;

  translate([0, hole_diameter / 2 + side_hole_depth, 45])
  rotate([90, 0])
  linear_extrude(height = side_hole_depth + 1)
  hull() {
    circle(d = 8.2);
    translate([0, 50]) circle(d = 8.2);
  }
}
