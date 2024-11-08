include <./parameters.scad>

use <./dovetail-generator.scad>
use <./screw-hole.scad>

f1_h = (f1_wall_height - dt_depth) / 2;
f1_side_w = (f1_side_wall_width - dt_depth) / 2;

module side_wall_body() cube([f1_h, f1_side_w, wall_thickness]);

module side_wall_screw_hole(trans = [0, 0, 0], flip = 0)
  translate([wall_thickness / 2 + trans.x, f1_side_w / 2 + trans.y, trans.z]) screw_hole(flip = flip);

module floor_1_side_wall_1() translate([0, dt_depth]) {
  difference() {
    side_wall_body();
    side_wall_screw_hole(trans = [0, 0, wall_thickness], flip = 1);
  }

  translate([f1_h, -dt_depth]) cube([dt_depth, dt_depth, wall_thickness]);
  translate([0, -dt_depth]) dt_pin_section(width = f1_h, thickness = dt_pin_section_thickness);
  translate([f1_h, f1_side_w]) rotate(270) dt_socket_section(width = f1_side_w, thickness = wall_thickness - dt_pin_section_thickness);
}

module floor_1_side_wall_2() translate([0, dt_depth]) {
  difference() {
    side_wall_body();
    side_wall_screw_hole(flip = 0);
  }

  rotate(90) translate([0, -f1_h - dt_depth]) dt_pin_section(width = f1_side_w, thickness = dt_pin_section_thickness);
  translate([0, -dt_depth]) dt_socket_section(width = f1_h, thickness = wall_thickness - dt_pin_section_thickness);
}

module floor_1_side_wall_3() translate([dt_depth, 0]) {
  difference() {
    side_wall_body();
    side_wall_screw_hole(trans = [f1_h - wall_thickness, 0, wall_thickness], flip = 1);
  }

  translate([0, f1_side_w]) dt_pin_section(width = f1_h, thickness = dt_pin_section_thickness);
  translate([-dt_depth, f1_side_w]) rotate(270) dt_socket_section(width = f1_side_w, thickness = wall_thickness - dt_pin_section_thickness);
}

module floor_1_side_wall_4() translate([dt_depth, 0]) {
  difference() {
    side_wall_body();
    side_wall_screw_hole(trans = [f1_h - wall_thickness, 0, 0], flip = 0);
  }

  rotate(90) dt_pin_section(width = f1_side_w, thickness = dt_pin_section_thickness);
  translate([0, f1_side_w]) dt_socket_section(width = f1_h, thickness = wall_thickness - dt_pin_section_thickness);
}

f1_rear_h = (f1_wall_height - dt_depth) / 2;

module rear_wall_body() cube([f1_h, rear_wall_width, wall_thickness]);

module rear_wall_screw_hole(trans = [0, 0, 0], flip = 0)
  translate([wall_thickness / 2 + trans.x, f1_side_w / 2 + trans.y, trans.z]) screw_hole(flip = flip);

module floor_1_rear_wall_1() {
  difference() {
    rear_wall_body();
    translate([wall_thickness / 2, rear_wall_width / 2]) screw_hole(flip = 0);
  }

  translate([f1_rear_h + dt_depth, 0]) rotate(90) dt_pin_section(width = rear_wall_width, thickness = dt_pin_section_thickness);
}

module floor_1_rear_wall_2() {
  difference() {
    translate([dt_depth, 0]) rear_wall_body();
    translate([f1_h + dt_depth - wall_thickness / 2, rear_wall_width / 2, wall_thickness]) screw_hole(flip = 1);
  }

  translate([dt_depth, 0])
    rotate([0, 0, 90]) dt_socket_section(width = rear_wall_width, thickness = wall_thickness - dt_pin_section_thickness);
}
