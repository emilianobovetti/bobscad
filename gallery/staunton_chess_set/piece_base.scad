use <../../modules/cubic_bezier.scad>

module piece_base(d, h) {
  r = d / 2;

  rotate_extrude() cubic_bezier(
      debug=false, curve=[
        [undef, [r - 0.5, 0], [r - 0.5, 0]],
        [[r, 0.6], [r, 0.6], undef],
        [[r, h - 0.2], [r, h - 0.2], [r, h]],
        [[r, h], [r - 1, h], undef],
        [[0, h], [0, h], undef],
        [[0, 0], [0, 0], undef],
      ]
    );
}
