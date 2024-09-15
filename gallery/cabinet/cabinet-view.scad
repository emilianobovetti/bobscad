include <./parameters.scad>

space = (1 - $t) * 1.5 * dt_depth;

use <./cabinet-floor.scad>

translate([0, (floor_depth - dt_depth) / 2]) {
  translate([0, space]) ground_floor_rear();

  translate([0, dt_depth, floor_thickness])
    rotate([0, 180, 180]) ground_floor_front();

  translate([0, space, f1_wall_height - floor_thickness + space]) middle_floor_rear();
  translate([0, dt_depth, f1_wall_height + floor_thickness + space]) rotate([180, 0]) middle_floor_front();

}

use <./cabinet_walls.scad>
use <../../modules/copy_rotate.scad>

translate([floor_width / 2, (f1_side_wall_width + space) / 2])
copy_rotate([0, 0, 180])
translate([-floor_width / 2, -(f1_side_wall_width + space) / 2])
rotate([0, -90]) {
  translate([0, (f1_side_wall_width - dt_depth) / 2 + space])
    floor_1_side_wall_1();

  translate([f1_wall_height + space, (f1_side_wall_width - dt_depth) / 2 + space, wall_thickness]) rotate([0, 180])
    floor_1_side_wall_2();

  translate([(f1_wall_height - dt_depth) / 2 + space, 0])
    floor_1_side_wall_3();

  translate([(f1_wall_height + dt_depth) / 2, 0, wall_thickness]) rotate([0, 180])
    floor_1_side_wall_4();
}

translate([rear_wall_width - wall_thickness, wall_thickness + floor_depth + space]) rotate([90, -90]) {
  floor_1_rear_wall_1();
  translate([(f1_wall_height - dt_depth) / 2 + space, 0]) floor_1_rear_wall_2();
}
