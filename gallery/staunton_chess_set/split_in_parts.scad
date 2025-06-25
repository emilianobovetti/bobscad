

module split_in_parts(part_idx = 0) {
  assert(part_idx >= 0 && part_idx <= 2, "split_in_parts: part_idx must be 0, 1 or 2");

  if (part_idx == 0) {
    children();
  } else {
    intersection() {
      children();

      if (part_idx == 1) {
        cylinder(h=3.7, d=100);
      } else if (part_idx == 2) {
        translate([0, 0, 3.7]) cylinder(h=100, d=100);
      }
    }
  }
}
