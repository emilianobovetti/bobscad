include <./parameters.scad>

space = (1 - $t) * 1.5 * dt_depth;

use <./cabinet-floor.scad>

translate([0, (floor_depth - dt_depth) / 2]) {
  translate([0, space]) floor_rear_sec();

  translate([floor_width, dt_depth, floor_thickness])
    rotate(180) mirror([0, 0, 1]) floor_front_sec();
}

use <./cabinet-first-block-walls.scad>

rotate([0, -90]) {
  translate([0, (wall_first_block_width - dt_depth) / 2 + space])
    first_block_side_wall_1();

  translate([wall_first_block_height + space, (wall_first_block_width - dt_depth) / 2 + space, wall_thickness]) rotate([0, 180])
    first_block_side_wall_2();

  translate([(wall_first_block_height - dt_depth) / 2 + space, 0])
    first_block_side_wall_3();

  translate([(wall_first_block_height + dt_depth) / 2, 0, wall_thickness]) rotate([0, 180])
    first_block_side_wall_4();
}
