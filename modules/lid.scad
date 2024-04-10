module lid(
  hole_diameter,
  edge_height,
  inner_border = 0,
  base_height = 1,
  edge_thickness = 1,
  $fn = 100
) {
  inner_radius = hole_diameter / 2;
  outer_radius = inner_radius + edge_thickness;

  cylinder(h = base_height, r = outer_radius);

  translate([ 0, 0, base_height ]) difference() {
    cylinder(h = edge_height, r = outer_radius);
    cylinder(h = edge_height + .01, r = hole_diameter / 2);
  }

  rotate_extrude() translate([inner_radius - inner_border, base_height]) difference() {
    square([inner_border, inner_border]);
    translate([0, inner_border]) circle(r = inner_border);
  }
}
