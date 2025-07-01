// Recommended height = 50 (minimum = 45 maximum = 55)
// Base diameter should measure 40-50% of piece height (20 to 25)

use <../../modules/cubic_bezier.scad>
use <../../modules/ring.scad>
use <./add_nut_embedding.scad>
use <./split_in_parts.scad>

$fn = 100;

part = 0; // [0:all, 1:base, 2:body]
part_idx = part;

// 24.8 / 50 =~ 0.496
// %cylinder(h=50, d=24.8);

module pawn() {
  scale([0.85, 0.85, 0.91]) {
    render(convexity=2) difference() {
        import(file="WCC_Pawn.stl");

        translate([0, 0, 35]) ring(inner=13, outer=22, height=3.5);
        translate([-10, -10, 39.96]) cube(20);
        cylinder(d=30, h=4.07);
      }

    base(d=29.16, h=4.07);

    translate([0, 0, 32]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [5.44, 0], [5.44, 1.1]],
            [[6, 1.1], [6.35, 1.1], [7.8, 3.5]],
            [[10.1, 4.3], [10.1, 4.45], [10.1, 4.45]],
            [[9.5, 6.2], [6.5, 6.2], undef],
            [[6.5, 6.2], [6.5, 6.2], undef],
            [[0, 6.2], [0, 6.2], undef],
            [[0, 0], [0, 0], undef],
          ]
        );

    translate([0, 0, 4]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [13.5, 0], [14, 1]],
            [[14.47, 2], [14.47, 2], undef],
            [[0, 2], [0, 2], undef],
            [[0, 0], [0, 0], undef],
          ]
        );
  }

  translate([0, 0, 42.3]) sphere(d=15.4);
}

split_in_parts(cut_height=3.711, part_idx=part_idx) add_nut_embedding(cut_height=3.711, count=1) {
    if (part_idx == 0) %pawn(); else pawn();
  }

module base(d, h) {
  r = d / 2;

  rotate_extrude() cubic_bezier(
      debug=false, curve=[
        [undef, [r - 0.5, 0], [r - 0.5, 0]],
        [[r, 0.6], [r, 0.6], undef],
        [[r, h - 0.27], [r, h - 0.27], [r, h]],
        [[r - 0.6, h], [r - 1, h], undef],
        [[0, h], [0, h], undef],
        [[0, 0], [0, 0], undef],
      ]
    );
}
