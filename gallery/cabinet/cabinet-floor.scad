include <./parameters.scad>

use <./dovetail-generator.scad>
use <./hex-housing.scad>

body_width = floor_width;
body_depth = (floor_depth - dt_depth) / 2;

module floor_body() difference() {
  cube([body_width, body_depth, floor_thickness]);

  translate([0, body_depth / 2]) hex_housing();
  translate([body_width - hex_thickness , body_depth / 2]) rotate(180) hex_housing();
}

module floor_front_sec() {
  dt_pin_section(width = body_width);

  translate([0, dt_depth, floor_thickness]) mirror([0, 0, 1]) floor_body();
}

module floor_rear_sec() {
  dt_socket_section(width = body_width, thickness = floor_thickness);

  translate([0, dt_depth]) difference() {
    floor_body();

    translate([floor_depth, body_depth - hex_thickness]) rotate(270) hex_housing();
  }
}
