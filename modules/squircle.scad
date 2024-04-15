module squircle(r = 1, n = 3, $fn = 100) {
  angle_step = round(360 / $fn);
  r_n = r ^ n;
  inv_n = 1 / n;

  section = [
    for(angle = [0 : min(angle_step, 90) : 90]) [
      (r_n / (1 + tan(angle) ^ n)) ^ inv_n,
      (r_n / (1 + tan(angle) ^ -n)) ^ inv_n,
    ]
  ];

  hull() polygon(points = [
    each section,
    for(p = section) [-p.x, p.y],
    for(p = section) [-p.x, -p.y],
    for(p = section) [p.x, -p.y],
  ]);
}
