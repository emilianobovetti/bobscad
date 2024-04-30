$fn = 75;

module sphere_surface(d, t) difference() {
  sphere(d = d);
  sphere(d = d - t);
}

difference() {
  translate([0, 0, 2.3]) scale([1, 1, 1.1])
    sphere_surface(d = 12.8, t = 0.7);

  translate([-10, -10, 8.4]) cube(20);
  translate([-10, -10, -20]) cube(20);
  cylinder(d = 6, h = 8.5);
}

difference() {
  translate([0, 0, 2.5]) {
    hull() {
      cylinder(d = 7.5, h = 0.1);
      translate([0, 0, 5.5]) cylinder(d = 7.2, h = 0.1);
    }

    hull() {
      translate([0, 0, 5.5]) cylinder(d = 7.2, h = 0.1);
      translate([0, 0, 5.8]) cylinder(d = 6.3, h = 0.1);
    }
  }

  hull() {
    translate([0, 0, 2.4]) cylinder(d = 4.9, h = 0.1);
    translate([0, 0, 8.4]) cylinder(d = 5.8, h = 0.1);
  }
}
