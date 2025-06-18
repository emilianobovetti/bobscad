use <../../modules/copy_translate.scad>

module add_nut_embedding(count = 1) {
  assert(count > 0, "add_nut_embedding: argument must be positive");
  assert(count < 3, "add_nut_embedding: unsupported number of embedding");

  difference() {
    if ($preview)
      color([1, 0.85, 0, 0.8]) children();
    else
      children();

    color([0.7, 0.7, 0.7]) translate([0, 0, 1]) if (count == 1) {
        m8_nut();
      } else if (count == 2) {
        copy_translate([0, 0, m8_h]) m8_nut();
      }
  }
}

m8_s = 13.2;
m8_d = m8_s * sqrt(4 / 3);
m8_h = 6.5;
m8_i = 6.1;

module m8_nut() difference() {
    cylinder(d=m8_d, h=m8_h, $fn=6);

    translate([0, 0, -0.1]) cylinder(d=m8_i, h=m8_h + 0.2);
  }
