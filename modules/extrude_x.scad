module extrude_x(offset = 0) hull() {
  children();
  translate([offset, 0]) children();
}
