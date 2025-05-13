points = [
  [18, 14],
  [20, 8],
  [20, 3],
  [18, 1.5],
  [16, 1.5],
  [15, 2],
  [14, 3],
  [13.5, 4],
  [13.5, 8],
  [15, 35],
  [15, 37],
  [14, 39],
  [12, 41],
  [10, 42],
  [8, 42],
  [6, 41.5],
  [4.5, 40.5],
  [2.5, 38],
  [2, 34],
  [3, 32],
  [5, 29],
  [5.5, 27],
  [5.5, 26],
  [5, 24],
  [4, 24],
  [3, 24.5],
  [2, 25.5]
];

assert(len(points) > 1, "Error: too few points");

linear_extrude(height = 1.5) for (idx = [0 : len(points) - 2]) hull() {
  translate(points[idx]) circle(r = 1.2);
  translate(points[idx + 1]) circle(r = 1.2);
}
