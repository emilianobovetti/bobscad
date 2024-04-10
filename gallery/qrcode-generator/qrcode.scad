$fn = 100;

cube([110, 110, 2]);

translate([2, 2, 1])
  linear_extrude(3)
  scale(3)
  offset(delta = 0.01)
  import(file = "qrcode.svg");
