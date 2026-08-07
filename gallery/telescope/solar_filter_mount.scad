use <../../modules/threads.scad>

$fa = 3;
$fs = 0.3;

height = 15;
hole_diameter = 80;
mount_diameter = 113.2;
threads_tolerance = 0.7;

p1_thickness = 5;
p1_threads_radius = 56.5 + p1_thickness;

p2_thickness = 5;
p2_threads_radius = p1_threads_radius + threads_tolerance;

module p1() {
  extrude_thread_profile(h=height) difference() {
      profile2_polygon(r=p1_threads_radius);

      circle(d=mount_diameter);
    }

  linear_extrude(height=2) difference() {
      circle(r=p1_threads_radius - 0.2);

      circle(d=hole_diameter);
    }
}

module p2() {
  translate([0, 0, 2]) extrude_thread_profile(h=height) difference() {
        circle(r=p2_threads_radius + p2_thickness);

        profile2_polygon(r=p2_threads_radius);
      }

  linear_extrude(height=2) difference() {
      circle(r=p2_threads_radius + p2_thickness);

      circle(d=hole_diameter);
    }
}

*intersection() {
  union() {
    translate([0, 0, 2]) p1();
    p2();
  }

  cube(100);
}

p1();
