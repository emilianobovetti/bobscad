use <../functions/reverse.scad>

module superellipse(ra = 1, rb = 1, n = 3, $fn = 100) {
  inv_n = 1 / n;
  step = 90 / $fn * 4;

  pos_quadrant_pts = [
    for(angle = [0 : step : 90])
      let(x = sin(angle) * ra, y = rb * (1 - (x / ra) ^ n) ^ inv_n) [x, y]
  ];

  rev_pos_quadrant_pts = reverse(pos_quadrant_pts);

  polygon(points = [
    each rev_pos_quadrant_pts,
    for(p = pos_quadrant_pts) [-p.x, p.y],
    for(p = rev_pos_quadrant_pts) [-p.x, -p.y],
    for(p = pos_quadrant_pts) [p.x, -p.y]
  ]);
}
