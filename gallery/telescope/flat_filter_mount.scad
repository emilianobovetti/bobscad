use <../../modules/threads.scad>

$fa = 3;
$fs = 0.3;

piece = "I"; // [I:Inner, O:Outer, M:Mask, P:Preview]

height = 15;
hole_diameter = 100;
mount_diameter = 113.2;
threads_tolerance = 0.8;

inner_section_wall_thickness = 2;
inner_section_base_thickness = 1;
inner_section_threads_radius = 56.5 + inner_section_wall_thickness;

outer_section_wall_thickness = 2;
outer_section_base_thickness = 2;
outer_section_threads_radius = inner_section_threads_radius + threads_tolerance;
pin_height = 2;
pin_diameter = 3;
pin_radius = inner_section_threads_radius / 2 + hole_diameter / 4; // 54.25

mask_base_thickness = 4;
mask_pin_tolerance = 0.2;
mask_radius_tolerance = 1.5;

module mask_section() linear_extrude(height=mask_base_thickness) difference() {
      circle(r=outer_section_threads_radius - mask_radius_tolerance);

      for (idx = [0:3])
        rotate(90 * idx)
          translate([pin_radius, 0])
            circle(d=pin_diameter + mask_pin_tolerance);
    }

module inner_section() {
  extrude_thread_profile(h=height) difference() {
      profile2_polygon(r=inner_section_threads_radius);

      circle(d=mount_diameter);
    }

  linear_extrude(height=inner_section_base_thickness) difference() {
      circle(r=inner_section_threads_radius - 0.2);

      circle(d=hole_diameter);
    }
}

module outer_section() {
  translate([0, 0, outer_section_base_thickness]) extrude_thread_profile(h=height) difference() {
        circle(r=outer_section_threads_radius + outer_section_wall_thickness);

        profile2_polygon(r=outer_section_threads_radius);
      }

  linear_extrude(height=outer_section_base_thickness) difference() {
      circle(r=outer_section_threads_radius + outer_section_wall_thickness);

      circle(d=hole_diameter);
    }

  for (idx = [0:3])
    rotate(90 * idx)
      translate([pin_radius, 0, outer_section_base_thickness])
        cylinder(h=pin_height, d=pin_diameter);
}

if (piece == "I") {
  inner_section();
} else if (piece == "O") {
  outer_section();
} else if (piece == "M") {
  mask_section();
} else {
  intersection() {
    union() {
      translate([0, 0, outer_section_base_thickness]) inner_section();
      outer_section();
    }

    cube(100);
  }
}
