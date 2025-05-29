use <../functions/is_2d_point.scad>

module cubic_bezier(curve, debug = false) {
  latest = len(curve) - 1;

  if (debug) {
    for (idx = [0:latest]) {
      points = fill_undef(curve[idx]);

      color([0.5, 0.5, 0.5, 0.5])
        debug_point(points[1]);

      color([0.8, 0, 0, 0.5]) {
        debug_point(points[0]);
        debug_point(points[2]);
      }
    }
  }

  // https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Cubic_B%C3%A9zier_curves
  color(debug ? [1, 0.85, 0, 0.7] : undef) polygon(
      points=[
        for (idx = [0:latest - 1]) let (
          curr = fill_undef(curve[idx]),
          next = fill_undef(curve[idx + 1]),
          p0 = curr[1],
          p1 = curr[2],
          p2 = next[0],
          p3 = next[1],
          step = 1 / $fn
        ) for (t = [0:step:1]) let (
          k0 = (1 - t) ^ 3,
          k1 = 3 * (1 - t) ^ 2 * t,
          k2 = 3 * (1 - t) * t ^ 2,
          k3 = t ^ 3,
          x = p0.x * k0 + p1.x * k1 + p2.x * k2 + p3.x * k3,
          y = p0.y * k0 + p1.y * k1 + p2.y * k2 + p3.y * k3
        ) [x, y],
      ]
    );
}

function fill_undef(points) =
  let (
    ctrl1 = points[0],
    endpoint = points[1],
    ctrl2 = points[2],
    _endpoint = assert(is_2d_point(endpoint), "Invalid argument: the endpoint must be 2d point"),
    _ctrl = assert(is_2d_point(ctrl1) || is_2d_point(ctrl2), "Invalid argument: at least one control point must be provied")
  ) [
      is_list(ctrl1) ? ctrl1 : fill_ctrl(ctrl2, endpoint),
      endpoint,
      is_list(ctrl2) ? ctrl2 : fill_ctrl(ctrl1, endpoint),
  ];

function fill_ctrl(p1, p2) =
  let (dx = p2.x - p1.x, dy = p2.y - p1.y) [p2.x + dx, p2.y + dy];

module debug_point(center) translate(center) circle(d=0.1);
