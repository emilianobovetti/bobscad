use <../../modules/copy_translate.scad>
use <../../modules/hexagonal_nut.scad>

m8_s = 13.8;
m8_h = 7;
m8_i = 6.1;
nut_embedding_h = 1;

module add_nut_embedding(cut_height, count = 1) {
  assert(count > 0 && count <= 2, "add_nut_embedding: count must be 1 or 2");

  difference() {
    if ($preview)
      color([1, 0.85, 0, 0.8]) %children();
    else
      children();

    color([0.7, 0.7, 0.7]) render(convexity=1) {
        translate([0, 0, nut_embedding_h]) if (count == 1) {
          m8_nut();
        } else if (count == 2) {
          copy_translate([0, 0, m8_h]) m8_nut();
        }

        if (is_num(cut_height) && cut_height > 0) {
          translate([0, 0, cut_height - 0.01]) hexagonal_nut(s=m8_s + 0.4, h=0.8, i=m8_i + 0.1);
          translate([0, 0, cut_height - 0.2]) cylinder(h=0.2, d=m8_i + 0.1);
        }
      }
  }
}

module m8_nut() hexagonal_nut(s=m8_s, h=m8_h, i=m8_i);
