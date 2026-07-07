use <./isosceles.scad>

module chord_ra(r, a, offset_in = undef, offset_out = undef) {
  fallback_offset = is_undef(offset_in) && is_undef(offset_out) ? 0.5 : 1;
  fallback_offset_in = is_undef(offset_out) ? fallback_offset : 0;
  fallback_offset_out = is_undef(offset_in) ? fallback_offset : 0;
  in = is_undef(offset_in) ? fallback_offset_in : offset_in;
  out = is_undef(offset_out) ? fallback_offset_out : offset_out;

  assert(in >= 0, "Invalid argument: offset_in cannot be negative");
  assert(out >= 0, "Invalid argument: offset_out cannot be negative");

  rotate(90 - a / 2) intersection() {
      difference() {
        circle(r=r + out);
        circle(r=r - in);
      }

      // TODO: handle angles >= 180
      isosceles(height=r + out, vertex_angle=a);
    }
}

module chord_lh(l, h, offset_in = undef, offset_out = undef) {
  radius = (l ^ 2) / (8 * h) + h / 2;
  angle = 2 * asin(l / (2 * radius));

  translate([0, h - radius]) chord_ra(
      r=radius,
      a=angle,
      offset_in=offset_in,
      offset_out=offset_out
    );
}
