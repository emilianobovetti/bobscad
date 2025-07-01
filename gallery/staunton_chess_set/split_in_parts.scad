

module split_in_parts(cut_height, part_idx = 0) {
  assert(is_num(cut_height) && cut_height > 0, "split_in_parts: cut_height must be positive");
  assert(part_idx >= 0 && part_idx <= 2, "split_in_parts: part_idx must be 0, 1 or 2");

  if (part_idx == 0) {
    children();
  } else {
    intersection() {
      children();

      if (part_idx == 1) {
        cylinder(h=cut_height, d=100);
      } else if (part_idx == 2) {
        translate([0, 0, cut_height]) cylinder(h=100, d=100);
      }
    }
  }
}
