$fa = 5;
$fs = 0.5;

base_diameter = 50;
base_thickness = 4;
base_chamfer = 1.5;

wall_diameter = base_diameter;
wall_height = 50;
wall_thickness = 3;

threads_height = 8;
threads_radius = wall_diameter / 2;
lid_external_diameter = wall_diameter + 7;
lid_internal_diameter = wall_diameter - wall_thickness * 2;
lid_bottom_thickness = 4;
lid_chamfer = 1.5;

base_radius = base_diameter / 2;
wall_radius = wall_diameter / 2;
lid_external_radius = lid_external_diameter / 2;
lid_internal_radius = lid_internal_diameter / 2;
base_height = base_thickness + base_chamfer;
lid_height = lid_bottom_thickness + lid_chamfer;

split_ring_margin = 2;
split_outer_margin = 10;
split_width = 0.8;

split_max_diameter = 2 * base_radius - split_outer_margin;
split_min_diameter = 4 + split_width;

split_step_size = -2 * (split_width + split_ring_margin);

split_max_angle = 120;
split_min_angle = 30;
