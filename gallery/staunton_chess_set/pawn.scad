// Recommended height = 50 (minimum = 45 maximum = 55)
// Base diameter should measure 40-50% of piece height (20 to 25)

use <../../modules/cubic_bezier.scad>
use <./add_nut_hole.scad>

$fn = 100;

// 24.8 / 50 =~ 0.496
// %cylinder(h=50, d=24.8);

module pawn() {
  scale([0.85, 0.85, 0.91]) {
    render(convexity=2) difference() {
        import(file="WCC_Pawn.stl");

        translate([-10, -10, 39.96]) cube(20);
      }

    cylinder(d=29.16, h=3.8);

    translate([0, 0, 33.1]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [6.4, 0], [7.6, 3]],
            [[10, 3.3], [10.17, 3.35], undef],
            [[10.5, 4.6], [10.35, 4.7], [10.35, 4.7]],
            [[6.5, 5.7], [6.5, 5.7], undef],
            [[0, 5.7], [0, 5.7], undef],
            [[0, 0], [0, 0], undef],
          ]
        );
  }

  translate([0, 0, 42.3]) sphere(d=15.4);
}

add_nut_hole() pawn();
