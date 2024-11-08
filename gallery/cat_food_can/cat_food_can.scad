use <../../modules/superellipse.scad>

$fn = 200;

inner_width = 100;
inner_depth = 70;
height = 130;
wall_thickness = 5;
floor_thickness = 5;
floor_offset = 0;

difference() {
  inn_ra = inner_width / 2;
  inn_rb = inner_depth / 2;
  out_ra = inn_ra + wall_thickness;
  out_rb = inn_rb + wall_thickness;

  linear_extrude(height) superellipse(ra = out_ra, rb = out_rb, n = 8);

  translate([0, 0, -0.01])
    linear_extrude(floor_offset)
    superellipse(ra = out_ra - 10, rb = out_rb - 10, n = 8);

  translate([0, 0, floor_thickness + floor_offset])
    linear_extrude(height)
    superellipse(ra = inn_ra, rb = inn_rb, n = 8);

  translate([7 - out_ra, 3.5 + out_rb, height / 2])
    rotate([90, 0])
    render(convexity = 2)
    linear_extrude(height = 5)
    scale(0.23)
    import(file = "Cat_silhouette.svg");
}
