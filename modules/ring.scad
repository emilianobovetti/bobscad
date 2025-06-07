module ring(inner, outer, height) if (is_undef(height))
    ring_2d(inner=inner, outer=outer);
  else
    ring_3d(inner=inner, outer=outer, height=height);

module ring_2d(inner, outer) difference() {
    assert(inner < outer, "Invalid argument: inner ring diameter must be smaller than outer");

    circle(d=outer);
    circle(d=inner);
  }

module ring_3d(inner, outer, height)
  linear_extrude(height=height) ring_2d(inner=inner, outer=outer);
