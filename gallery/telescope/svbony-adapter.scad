use <../../modules/lid.scad>

$fn = 100;

tolerance = 0.3;
hole_diameter = 31.5 + tolerance;

difference() {
  cylinder(d = 37, h = 4.5);
  translate([0, 0, -1]) cylinder(d = hole_diameter, h = 6);
}

difference() {
  cylinder(d = 45, h = 4.5);
  translate([0, 0, -1]) cylinder(d = 41.8 + tolerance, h = 6);
}

translate([0, 0, 4.5]) {
  difference() {
    cylinder(d = 45, h = 5);
    translate([0, 0, -1]) cylinder(d = hole_diameter, h = 7);
  }

  translate([0, 0, 5]) difference() {
    cylinder(d = hole_diameter + 5, h = 22);
    translate([0, 0, -1]) cylinder(d = hole_diameter, h = 24);
  }
}
