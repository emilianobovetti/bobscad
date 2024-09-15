include <./parameters.scad>

use <./dovetail-generator.scad>
use <./hex-housing.scad>

body_width = floor_width;
body_depth = (floor_depth - dt_depth) / 2;

module ground_floor_body() difference() {
  cube([body_width, body_depth, floor_thickness]);

  translate([hex_thickness, body_depth / 2]) hex_housing();
  translate([body_width - hex_thickness , body_depth / 2]) rotate(180) hex_housing();
}

module ground_floor_front() {
  dt_pin_section(width = body_width, thickness = dt_pin_section_thickness);
  translate([0, dt_depth, floor_thickness]) mirror([0, 0, 1]) ground_floor_body();
}

module ground_floor_rear() {
  dt_socket_section(width = body_width, thickness = floor_thickness - dt_pin_section_thickness);

  translate([0, dt_depth]) difference() {
    ground_floor_body();

    translate([body_width / 2, body_depth - hex_thickness]) rotate(270) hex_housing();
  }
}

module middle_floor_body() difference() {
  cube([body_width, body_depth, 2 * floor_thickness]);

  translate([hex_thickness, body_depth / 2]) hex_housing();
  translate([body_width - hex_thickness , body_depth / 2]) rotate(180) hex_housing();

  translate([hex_thickness, body_depth / 2, 2 * floor_thickness]) rotate([180, 0]) hex_housing();
  translate([body_width - hex_thickness, body_depth / 2, 2 * floor_thickness]) rotate([0, 180]) hex_housing();
}

module middle_floor_front() {
  dt_pin_section(width = body_width, thickness = 2 * dt_pin_section_thickness);
  translate([0, dt_depth]) middle_floor_body();
}

module middle_floor_rear() {
  dt_socket_section(width = body_width, thickness = 2 * (floor_thickness - dt_pin_section_thickness));

  translate([0, dt_depth]) difference() {
    middle_floor_body();

    translate([body_width / 2, body_depth - hex_thickness]) {
      rotate(270) hex_housing();
      translate([0, 0, 2 * floor_thickness]) rotate([180, 0, 270]) hex_housing();
    }
  }
}
