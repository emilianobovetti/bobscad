use <./superellipse.scad>

module squircle(r = 1, n = 3)
  superellipse(ra = r, rb = r, n = n);
