include <./params.scad>

module helix(height = 1, radius = 1, steps = 100, angle = 360) {
  for (step = [0:steps - 1]) {
    frac = step / steps;

    rotate(angle * frac) translate([radius, 0, height * frac]) children();
  }
}

module wall_section_cylinder(diameter, height, thickness)
  linear_extrude(height) difference() {
      circle(d=diameter);
      circle(d=diameter - thickness * 2);
    }

module wall_section(diameter, height, thickness, hole_size, vertical_margin) difference() {
    wall_section_cylinder(diameter=diameter, height=height, thickness=thickness);

    radius = (diameter / 2 - thickness) - vertical_margin;

    helix(height=height - hole_size - vertical_margin, radius=radius, steps=100)
      cube([thickness * 2, hole_size, hole_size]);
  }

module wall(hole_size = 0.8, vertical_margin = 0.2) {
  section_height = hole_size * 2;

  for (h = [0:section_height:wall_height]) {

    translate([0, 0, h])
      render() wall_section(
          diameter=wall_diameter,
          height=section_height,
          thickness=wall_thickness,
          hole_size=hole_size,
          vertical_margin=vertical_margin
        );
  }
}
