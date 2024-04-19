module translate_hull_each(vec) for(idx = [0 : $children - 1]) hull() {
  children(idx);
  translate(vec) children(idx);
}
