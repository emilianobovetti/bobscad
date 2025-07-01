// Recommended height = 55 (minimum = 49.5 maximum = 60.5)
// Base diameter should measure 40-50% of piece height (22 to 27.5)

use <../../modules/cubic_bezier.scad>
use <../../modules/ring.scad>
use <./add_nut_embedding.scad>

$fn = 100;

// 27.5 / 55 =~ 0.5
// %cylinder(h=55, d=27.5);

module rook() scale([0.769, 0.769, 0.93]) {
    render(convexity=2) difference() {
        import(file="WCC_Rook.stl");

        translate([0, 0, 47]) ring(inner=27.5, outer=30, height=3);
      }

    translate([0, 0, 49.5]) difference() {
        render(convexity=2) ring(inner=17, outer=25.5, height=9.7);

        for (idx = [0:5])
          rotate(14 + 360 / 5 * idx)
            translate([10, 0, 9])
              cube([10, 2.3, 3], center=true);
      }

    cylinder(d=35.73, h=3.7);

    translate([0, 0, 43]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [9.35, 0], [9.35, 3]],
            [[13, 4.86], [13.75, 4.86], undef],
            [[0, 4.86], [0, 4.86], undef],
            [[0, 0], [0, 0], undef],
          ]
        );
  }

rook();
