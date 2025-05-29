module cubic_bezier(points, debug = false) {
  latest = len(points) - 1;

  if (debug) for (idx = [0 : 4 : latest]) {
    color([0.8, 0.8, 0.8, 0.5]) {
      debug_point(points[idx]);
      debug_point(points[idx + 3]);
    }

    color([0.8, 0, 0, 0.5]) {
      debug_point(points[idx + 1]);
      debug_point(points[idx + 2]);
    }
  }

  color(debug ? [1, 0.9, 0, 0.7] : undef) polygon(points = [
    for (idx = [0 : 4 : latest]) let(
      p0 = points[idx],
      p1 = points[idx + 1],
      p2 = points[idx + 2],
      p3 = points[idx + 3],
      step = 1 / $fn
    ) for(t = [0 : step : 1]) let(
        k0 = (1 - t) ^ 3,
        k1 = 3 * (1 - t) ^ 2 * t,
        k2 = 3 * (1 - t) * t ^ 2,
        k3 = t ^ 3,
        x = p0.x * k0 + p1.x * k1 + p2.x * k2 + p3.x * k3,
        y = p0.y * k0 + p1.y * k1 + p2.y * k2 + p3.y * k3
      ) [x, y]
  ]);
}

module debug_point(center) translate(center) circle(d = 0.1);
