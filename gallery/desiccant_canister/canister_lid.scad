include <./params.scad>

use <../../modules/threads.scad>
use <./split_shape.scad>

module lid() {
  extrude_thread_profile(h=threads_height) difference() {
      circle(r=lid_external_radius);
      profile2_polygon(r=threads_radius + 0.4);
    }

  translate([0, 0, threads_height])
    difference() {
      rotate_extrude()
        polygon(
          points=[
            [0, lid_chamfer],
            [lid_internal_radius - lid_chamfer, lid_chamfer],
            [lid_internal_radius, 0],
            [lid_external_radius, 0],
            [lid_external_radius, lid_bottom_thickness],
            [lid_external_radius - lid_chamfer, lid_bottom_thickness + lid_chamfer],
            [0, lid_bottom_thickness + lid_chamfer],
          ]
        );

      translate([0, 0, lid_chamfer - 0.1])
        linear_extrude(height=lid_bottom_thickness + 0.2)
          split_shape(
            max_diameter=split_max_diameter,
            min_diameter=split_min_diameter,
            max_angle=split_max_angle,
            min_angle=split_min_angle,
            split_width=split_width,
            step_size=split_step_size
          );
    }
}

translate([0, 0, lid_height + threads_height]) rotate([180, 0]) lid();
