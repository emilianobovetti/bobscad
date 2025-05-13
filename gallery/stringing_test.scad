$fn = 100;

// make sure klipper config has the `firmware_retraction` enabled
// and the slicer is using G10/G11 correctly

// ref: https://www.klipper3d.org/G-Codes.html#tuning_tower_1

// TUNING_TOWER COMMAND=SET_RETRACTION PARAMETER=RETRACT_LENGTH SKIP=3.2 STEP_HEIGHT=3.2 START=0 STEP_DELTA=0.2
// TUNING_TOWER COMMAND=SET_RETRACTION PARAMETER=RETRACT_SPEED SKIP=3.2 STEP_HEIGHT=3.2 START=20 STEP_DELTA=5
// TUNING_TOWER COMMAND=SET_RETRACTION PARAMETER=UNRETRACT_EXTRA_LENGTH SKIP=3.2 STEP_HEIGHT=3.2 START=0 STEP_DELTA=0.01
// TUNING_TOWER COMMAND=SET_RETRACTION PARAMETER=UNRETRACT_SPEED SKIP=3.2 STEP_HEIGHT=3.2 START=10 STEP_DELTA=5

SKIP = 3.2;
STEP_HEIGHT = 3.2;

change_num_steps = 2;
base_height_mm = 0.8;
column_distance_mm = 6;
column_diameter_mm = 1.5;

module section(diameter = column_diameter_mm, width = column_distance_mm, height, thickness = 0.2) union()
{
    radius = diameter / 2;
    x_offset = width / 2;

    translate([ 0, 0, height ]) linear_extrude(thickness) hull()
    {
        translate([ -x_offset, 0 ]) circle(r = radius);
        translate([ x_offset, 0 ]) circle(r = radius);
    }

    translate([ -x_offset, 0 ]) cylinder(r = radius, h = height);
    translate([ x_offset, 0 ]) cylinder(r = radius, h = height);
}

translate([ -5, -2.5 ]) cube([ 10, 5, base_height_mm ]);

// warmup section
section(height = SKIP);

for (step = [0:change_num_steps - 1])
    translate([ 0, 0, step *STEP_HEIGHT + SKIP ]) section(height = STEP_HEIGHT);
