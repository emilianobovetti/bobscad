use <./is_2d_point.scad>
use <./is_3d_point.scad>

function normalize_3d_point(p) =
  is_2d_point(p) ? [p.x, p.y, 0]
  : is_3d_point(p) ? p
  : assert(false, "Invalid argument: cannot normalize point");
