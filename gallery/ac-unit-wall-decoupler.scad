$fn = 100;

border = 5;
hole = 29.8;

translate([0, 0, 5]) linear_extrude(height = 5) difference() {
  circle(d = hole + border);
  circle(d = hole);
}

cylinder(d = hole + border, h = 5);
