module add_nut_hole() {
  difference() {
    if ($preview)
      %color([1, 0.85, 0, 0.7]) children();
    else
      children();

    color([0.7, 0.7, 0.7]) translate([0, 0, 2])
        cylinder(d=15.5, h=6.3, $fn=6);
  }
}
