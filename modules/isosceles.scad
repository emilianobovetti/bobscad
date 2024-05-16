module isosceles(length, vertex_angle) polygon(points = [
  [0, 0],
  [length, 0],
  [length * cos(vertex_angle), length * sin(vertex_angle)]
]);
