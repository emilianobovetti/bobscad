// Recommended height = 70 (minimum = 63 maximum = 77)
// Base diameter should measure 40-50% of piece height (28 to 35)

use <../../modules/cubic_bezier.scad>
use <./add_nut_hole.scad>

$fn = 100;

// 30.6 / 72 =~ 0.42
// %cylinder(h=72, d=30.6);

module bishop() {
  scale(0.961) {
    render(convexity=2) difference() {
        import(file="WCC_Bishop.stl");

        translate([0, 0, 45]) ring(inner=20.7, outer=22, height=3);
        translate([0, 0, 78.3]) cube(10, center=true);
      }

    cylinder(d=31.75, h=3.8);

    translate([0, 0, 72.6]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [1.9, 0], [1.9, 0.3]],
            [[2.4, 0.5], [2.4, 1], [2.4, 1.7]],
            [[1.6, 2.3], [0, 2.3], [0, 2]],
            [[0, 0], [0, 0], undef],
          ]
        );

    translate([0, 0, 41]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [6.5, 0], [6.5, 1]],
            [[6, 3], [10.35, 4.94], [10.35, 4.94]],
            [[0, 5.1], [0, 5.1], undef],
            [[0, 0], [0, 0], undef],
          ]
        );
  }
}

add_nut_hole() bishop();
