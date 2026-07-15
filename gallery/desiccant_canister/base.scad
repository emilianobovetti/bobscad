include <./params.scad>

use <./split_shape.scad>

module base() {
  difference() {
    rotate_extrude()
      polygon(
        points=[
          [0, 0],
          [base_radius - base_chamfer, 0],
          [base_radius, base_chamfer],
          [base_radius, base_thickness + base_chamfer],
          [base_radius - wall_thickness, base_thickness + base_chamfer],
          [base_radius - base_chamfer - wall_thickness, base_thickness],
          [0, base_thickness],
        ]
      );

    translate([0, 0, -0.1])
      linear_extrude(height=base_thickness + 0.2)
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
