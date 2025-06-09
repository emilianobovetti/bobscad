// Recommended height = 60 (minimum = 54 maximum = 66)
// Base diameter should measure 40-50% of piece height (24 to 30)

use <../../modules/copy_mirror.scad>
use <../../modules/cubic_bezier.scad>
use <../../modules/squared_circle.scad>
use <../../functions/is_2d_point.scad>
use <../../functions/normalize_3d_point.scad>
use <./add_nut_embedding.scad>

$fn = 100;

// 29.2 / 64 =~ 0.46
// %cylinder(h=64, d=29.2);

module knight() scale(0.8975) {
    render(convexity=2) difference() {
        import(file="WCC_Knight.stl");

        translate([-16, 10, 42]) rotate([90, 0]) linear_extrude(height=20) cubic_bezier(
                debug=false, curve=[
                  [undef, [0, 0], [0, 0]],
                  [[0, 0], [0, 1.83], [3, 1.83]],
                  [[4, 3.8], [7, 4.3], undef],
                  [[15, 4.5], [15.5, 4], undef],
                  [[15.45, 2], [15.45, 2], undef],
                  [[10, 0], [10, 0], undef],
                ]
              );
      }

    scale([1, 0.988]) cylinder(d=32.4, h=4.1);

    translate([0, 0, 16.6]) rotate_extrude()
        cubic_bezier(
          debug=false, curve=[
            [undef, [11.8, 0], [11.6, 0.2]],
            [[11.4, 0.2], [11.17, 0.4], [10.9, 0.8]],
            [[11.17, 1], [11.26, 1.2], [11.26, 1.2]],
            [[0, 1.2], [0, 1.2], undef],
            [[0, 0], [0, 0], undef],
          ]
        );

    translate([-27, 0]) linear_extrude(height=0.2)
        squared_circle(size=[20, 35, 0.2], r=6, center=true);

    support(base=10, tip=8, from=[-22, 0], to=[-21, 0, 28], bottom=10);
    support(base=8, tip=[7, 7.5], from=[-21, 0, 28], to=[-12, 0, 38]);

    support(base=[7, 7.5], tip=[4.3, 7.5], from=[-12, 0, 38], to=[-15.05, 0, 42.5], top=0.8);
    support(base=[7, 7.5], tip=[10.8, 7.5], from=[-12, 0, 38], to=[-6.6, 0, 44], top=0.8);

    support_interface(base=[0.4, 7.5], from=[-17, 0, 42.5], to=[-17, 0, 45], count=4);
    support_interface(base=[0.4, 7.5], from=[-11.8, 0, 44], to=[-11.8, 0, 47], count=9);
  }

module support(base, tip, from, to, walls = 1, top = 0, bottom = 0) {
  tip = is_undef(tip) ? base : tip;
  from = normalize_3d_point(is_undef(from) ? [0, 0] : from);
  to = normalize_3d_point(to);
  z_diff = abs(from.z - to.z);

  translate(v=from) linear_extrude(height=bottom) support_terminal(base);
  translate(v=[to.x, to.y, to.z - top]) linear_extrude(height=top) support_terminal(tip);

  difference() {
    from = [from.x, from.y, from.z + bottom];
    to = [to.x, to.y, to.z - top];

    support_shape(base=base, tip=tip, from=from, to=to);

    support_shape(
      base=reduce_size(size=base, diff=walls),
      tip=reduce_size(size=tip, diff=walls),
      from=from,
      to=to
    );
  }
}

module support_interface(base, from, to, count, gap = 1.3) {
  from = normalize_3d_point(from);
  to = normalize_3d_point(to);

  for (idx = [0:count - 1]) {
    offset = idx * gap;
    support(base=base, from=[from.x + offset, from.y, from.z], to=[to.x + offset, to.y, to.z]);
  }
}

module support_shape(base, tip, from, to) hull() {
    translate(v=from) linear_extrude(height=0.001)
        support_terminal(base);

    translate(v=to) linear_extrude(height=0.001)
        support_terminal(tip);
  }

module support_terminal(size) {
  if (is_num(size)) {
    circle(d=size);
  } else if (is_2d_point(size)) {
    square(size, center=true);
  } else {
    assert(false, "Invalid argument: expected diameter or 2d size");
  }
}

function reduce_size(size, diff) =
  is_num(size) ? size - diff
  : is_2d_point(size) ? [size.x - diff, size.y - diff]
  : assert(false, "Invalid argument: expected diameter or 2d size");

add_nut_embedding() knight();
