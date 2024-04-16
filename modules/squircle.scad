use <./superellipse.scad>

module squircle(r = 1, n = 3, $fn = 100)
  superellipse(ra = r, rb = r, n = n, $fn = $fn);
