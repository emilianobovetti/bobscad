use <../../modules/isosceles.scad>

$fn = 100;

inner_diameter = 32.2;
thickness = 2;
height = 10 + 4.5;

linear_extrude(height = height) difference() {
  circle(d = inner_diameter + thickness);
  circle(d = inner_diameter);
  isosceles(border_dist + 0.1, 5);
}

border_dist = (inner_diameter + thickness) / 2;



translate([0, 0, 3.3 + 4.5])
  rotate_extrude(angle = -355)
  translate([inner_diameter / 2, 0])
  circle(d = 1);

render() difference() {
  linear_extrude(height = height) difference() {
    rotate(-3) isosceles(border_dist + 5, 11);
    isosceles(border_dist + 5.1, 5);
    circle(d = inner_diameter + 0.1);
  }

  translate([border_dist + 2.5, 5, height / 2]) rotate([90, 0]) cylinder(d = 2, h = 10);
}
