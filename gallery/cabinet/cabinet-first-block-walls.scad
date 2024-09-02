include <./parameters.scad>

use <./dovetail-generator.scad>

body_width = (wall_first_block_width - dt_depth) / 2;
body_height = (wall_first_block_height - dt_depth) / 2;

module wall_body() cube([body_height, body_width, wall_thickness]);

module first_block_side_wall_1() translate([0, dt_depth]) {
  wall_body();
  translate([body_height, -dt_depth]) cube([dt_depth, dt_depth, wall_thickness]);
  translate([0, -dt_depth]) dt_pin_section(width = body_height);
  translate([body_height, body_width]) rotate(270) dt_socket_section(width = body_width, thickness = wall_thickness);
}

module first_block_side_wall_2() translate([0, dt_depth]) {
  wall_body();
  rotate(90) translate([0, -body_height - dt_depth]) dt_pin_section(width = body_width);
  translate([0, -dt_depth]) dt_socket_section(width = body_height, thickness = wall_thickness);
}

module first_block_side_wall_3() translate([dt_depth, 0]) {
  wall_body();
  translate([0, body_width]) dt_pin_section(width = body_height);
  translate([-dt_depth, body_width]) rotate(270) dt_socket_section(width = body_width, thickness = wall_thickness);
}

module first_block_side_wall_4() translate([dt_depth, 0]) {
  wall_body();
  rotate(90) dt_pin_section(width = body_width);
  translate([0, body_width]) dt_socket_section(width = body_height, thickness = wall_thickness);
}
