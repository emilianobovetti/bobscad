$fn = 100;

translate([0, 0, 8.5]) cylinder(d = 2.8, h = 7.5);
translate([0, 0, 7.5]) cylinder(d = 4.3, h = 1);
cylinder(d = 10, h = 7.5, $fn = 6);
translate([0, 0, -1]) cylinder(d = 4.3, h = 1);
translate([0, 0, -3.5]) cylinder(d = 2.8, h = 3.5);
translate([0, 0, -6.5]) cylinder(d = 1.9, h = 3, $fn = 6);
