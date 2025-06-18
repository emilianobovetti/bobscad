// Recommended height = 85 (minimum = 76.5 maximum = 93.5)
// Base diameter should measure 40-50% of piece height (34 to 42.5)

use <../../modules/ring.scad>
use <./add_nut_embedding.scad>

$fn = 100;

// 37.95 / 83.5 =~ 0.45
// %cylinder(h=83.5, d=37.95);

module queen() {
  render(convexity=2) difference() {
      import(file="WCC_Queen.stl");

      translate([0, 0, 55]) ring(inner=25.8, outer=30, height=3);
      translate([0, 0, 74.4]) cylinder(d=18, h=20);
    }

  cylinder(d=37.93, h=3.7);

  translate([0, 0, 70]) intersection() {
      sphere(10);
      cylinder(d=18, h=40);
    }

  translate([0, 0, 81]) sphere(2.5);
}

add_nut_embedding(count=2) queen();
