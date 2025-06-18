// Recommended height = 95 (minimum = 85.5 maximum = 104.5)
// Base diameter should measure 40-50% of piece height (38 to 47.5)

use <../../modules/copy_mirror.scad>
use <../../modules/cubic_bezier.scad>
use <../../modules/ring.scad>
use <./add_nut_embedding.scad>

$fn = 100;

// 39.5 / 95 =~ 0.416
// %cylinder(h=95, d=39.5);

module king() scale(1.038) {
    render(convexity=2) difference() {
        import(file="WCC_King.stl");

        translate([0, 0, 58]) ring(inner=24.7, outer=26, height=3);
        translate([0, 0, 92.54]) cube(20, center=true);
      }

    cylinder(d=38.058, h=3.8);

    translate([0, 0, 82]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [5.3, 0], [5.5, 0.1]],
            [[5.5, 0.1], [5.5, 0.4], undef],
            [[5.2, 1.2], [4.5, 1.2], undef],
            [[0, 1.2], [0, 1.2], undef],
            [[0, 0], [0, 0], undef],
          ]
        );

    translate([-1.5, 0, 83.2]) rotate([90, 0, 90])
        linear_extrude(height=3) copy_mirror([1, 0]) cubic_bezier(
              debug=false, curve=[
                [undef, [3.7, 0], [2.7, 0]],
                [undef, [2, 1.5], [2, 2.2]],
                [[2.4, 2], [4, 2.76], [4.5, 3]],
                [[4, 4.6], [4.7, 5.6], [1, 5.6]],
                [[1.7, 5.6], [2, 8.3], [2.2, 8.3]],
                [[1, 8.3], [0, 8.3], undef],
                [[0, 0], [0, 0], undef],
              ]
            );
  }

add_nut_embedding(count=2) king();
