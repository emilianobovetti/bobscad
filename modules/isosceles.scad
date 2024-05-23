module isosceles(height, vertex_angle) polygon(points =
  let (length = height / cos(vertex_angle / 2)) [
    [0, 0],
    [length, 0],
    [length * cos(vertex_angle), length * sin(vertex_angle)]
  ]
);
