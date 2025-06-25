//       ● ● ● ● ●       \
//     ●           ●     |
//   ●               ●   |
//  ●     ● ● ● ●     ●  |
// ●     ●       ●     ● |
// ●     ● - i - ●     ● |  => s
//  ●     ● ● ● ●     ●  |
//   ●               ●   |
//     ●           ●     |
//       ● ● ● ● ●       /

module hexagonal_nut_shape(s, h)
  cylinder(d=s * sqrt(4 / 3), h=h, $fn=6);

module hexagonal_nut(s, h, i) difference() {
    hexagonal_nut_shape(s=s, h=h);

    translate([0, 0, -0.1]) cylinder(d=i, h=h + 0.2);
  }
