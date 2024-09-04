include <./parameters.scad>

use <../../modules/dovetail.scad>
use <../../modules/copy_translate.scad>

module pin(depth = dt_depth, offset = 0)
  translate([0, depth])
  rotate([90, 0])
  linear_extrude(height = depth)
  offset(r = offset)
  dovetail(min_width = dt_min_width, max_width = dt_max_width, r1 = 1.2, r2 = 1.2, angle = 60);

module dt_pin_section(width, min_margin = 2) {
  space = dt_min_width;
  pin_size = 2 * dt_max_width;
  section_size = width - 2 * min_margin;
  count = floor((section_size - space) / pin_size);
  margin = (width - pin_size * count) / 2;

  assert(margin >= min_margin, "Error: min_margin constraint violated");

  cube([width, dt_depth, dt_pin_section_thickness]);

  for (idx = [0:count])
    translate([idx * pin_size + margin, 0, dt_pin_section_thickness]) pin();
}

module dt_socket(thickness) difference() {
  socket_thickness = thickness - dt_pin_section_thickness;
  height = socket_thickness - dt_clearance;

  translate([-dt_max_width / 2 - dt_clearance, 0])
    cube([dt_max_width + 2 * dt_clearance, dt_depth, height]);

  translate([0, -0.01, socket_thickness])
    mirror([0, 0, 1])
    pin(depth = dt_depth + dt_clearance, offset = dt_clearance);
}

module dt_socket_section(width, thickness, min_margin = 2) {
  socket_thickness = thickness - dt_pin_section_thickness;
  height = socket_thickness - dt_clearance;

  space = dt_min_width;
  socket_size = 2 * dt_max_width;
  section_size = width - 2 * min_margin;
  count = floor((section_size - space) / socket_size);
  margin = (width - socket_size * count) / 2;

  assert(margin >= min_margin, "Error: min_margin constraint violated");

  margin_gap = margin - (dt_max_width/2 + dt_clearance);
  copy_translate([width - margin_gap, 0]) cube([margin_gap, dt_depth, height]);

  for (idx = [0:count]) translate([idx * socket_size + margin, 0]) {
    dt_socket(thickness = thickness);

    section_gap = dt_max_width - 2 * dt_clearance;
    if (idx > 0) translate([-0.5 * (socket_size + section_gap), 0]) cube([section_gap, dt_depth, height]);
  }
}
