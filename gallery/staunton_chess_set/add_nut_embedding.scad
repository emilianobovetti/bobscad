use <../../modules/copy_mirror.scad>

module add_nut_embedding(on_layer1 = 1) {
  assert(on_layer1 > 0, "add_nut_embedding: argument must be positive");
  assert(on_layer1 < 3, "add_nut_embedding: unsupported number of embedding");

  difference() {
    if ($preview)
      %color([1, 0.85, 0, 0.7]) children();
    else
      children();

    color([0.7, 0.7, 0.7]) translate([0, 0, 1]) if (on_layer1 == 1) {
        m8_nut();
      } else if (on_layer1 == 2) {
        copy_mirror([0, 1]) translate([0, 7]) m8_nut();
      }
  }
}

module m8_nut() cylinder(d=16, h=6.4, $fn=6);
