include <./params.scad>

use <./base.scad>
use <./wall.scad>
use <./threads.scad>

module canister() {
  base();
  translate([0, 0, base_height]) wall();

  translate([0, 0, base_height + wall_height])
    extrude_thread_profile(h=threads_height) difference() {
        profile2_polygon(r=threads_radius);
        circle(r=threads_radius - wall_thickness);
      }
}

canister();
