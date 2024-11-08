$fn = 50;

width = 69;
height = 40;

module round_corner(r) difference() {
  translate([-0.1, -0.1]) square([r + 0.1, r + 0.1]);
  translate([r, r]) circle(r);
}

module body(thickness, s1, s2) linear_extrude(height = thickness) difference() {
  square([width, height]);

  // screw holes
  translate([6, 10.1]) circle(d = s1);
  translate([18, 10.1]) circle(d = s1);

  translate([width - 3, height - 1.8 - 1.4]) circle(d = s2);
  translate([width - 3, height - 1.8 * 2 - 1.4 * 2 - 11]) circle(d = s2);

  // stadium hole
  hull() {
    from_left = 12;
    from_top = 10;
    from_center_to_center = 17;

    translate([width - from_left, height - from_top]) circle(r = 5.2);
    translate([width - from_left - from_center_to_center, height - from_top]) circle(r = 5.2);
  }

  // remove bottom-right section
  hull() {
    translate([48.5 + 5, height - 25]) circle(r = 5);
    translate([width, height - 25]) circle(r = 5);
    translate([48.5 + 5, 0]) circle(r = 5);
    translate([width, 0]) circle(r = 5);
  }

  // remove top-left section
  hull() {
    translate([0, 20.2 + 5]) circle(r = 5);
    translate([28 - 5, 20.2 + 5]) circle(r = 5);
    translate([28 - 5, height]) circle(r = 5);
    translate([0, height]) circle(r = 5);
  }

  // round all remaining corners
  round_corner(2);
  translate([48.5, 0]) mirror([1, 0]) round_corner(2);
  translate([width, height - 20]) mirror([1, 0]) round_corner(2);
  translate([width, height]) mirror([1, 1]) round_corner(2);
  translate([0,  20.2]) mirror([0, 1]) round_corner(2);
  translate([28,  height]) mirror([0, 1]) round_corner(2);
}

side = "left";

body(thickness = 3, s1 = 4.5, s2 = 3.6);
translate([0, 0, side == "right" ? -3 : 3]) body(thickness = 3, s1 = 8, s2 = 8);
