use <../../modules/dovetail.scad>
use <../../modules/copy_translate.scad>

$fn = 50;

dt_depth = 25;
dt_max_width = 12.4;
dt_min_width = 10;
dt_clearance = 0.2;
dt_pin_section_thickness = 1.4;

floor_thickness = 8;
floor_width = 170 - (2 * floor_thickness);
floor_depth = 115 - floor_thickness - dt_depth;

wall_thickness = 8;

hex_thickness = 2.6;

module pin(depth = dt_depth, offset = 0)
  translate([0, depth])
  rotate([90, 0])
  linear_extrude(height = depth)
  offset(r = offset)
  dovetail(min_width = dt_min_width, max_width = dt_max_width, r1 = 1.2, r2 = 1.2, angle = 60);

module dt_pin_section(width, min_margin = 0) {
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

module dt_socket_section(width, thickness, min_margin = 0) {
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

module hex_housing(screw_len = 20, screw_d = 3.2, hex_size = 6.3, hex_t = hex_thickness, height = 4)
  translate([screw_len - hex_t - 0.001, 0]) rotate([90, 0, 90]) {
    linear_extrude(height = hex_t) hull() {
      circle(d = hex_size, $fn = 6);
      translate([0, height]) circle(d = hex_size, $fn = 6);
    }

    translate([0, height, -screw_len]) cylinder(d = screw_d, h = screw_len + 0.001);
  }

module floor_body() difference() {
  cube([floor_width, floor_depth, floor_thickness]);

  translate([0, floor_depth / 2]) hex_housing();
  translate([floor_width - hex_thickness , floor_depth / 2]) rotate(180) hex_housing();
}

module floor_front_sec() {
  dt_pin_section(width = floor_width);

  translate([0, dt_depth, floor_thickness]) mirror([0, 0, 1]) floor_body();
}

module floor_rear_sec() {
  dt_socket_section(width = floor_width, thickness = floor_thickness);

  translate([0, dt_depth]) difference() {
    floor_body();

    translate([floor_depth, floor_width / 2 + hex_thickness]) rotate(270) hex_housing();
  }
}

floor_rear_sec();

translate([floor_width, 0, floor_thickness])
  rotate(180) mirror([0, 0, 1]) floor_front_sec();
