use <../../modules/chord.scad>

module split_shape(max_diameter, min_diameter, max_angle, min_angle, split_width, step_size) {
  deg_over_mm = (min_angle - max_angle) / (max_diameter - min_diameter);
  angle_offset = (min_angle * min_diameter - max_angle * max_diameter) / (min_diameter - max_diameter);

  for (diameter = [max_diameter:step_size:min_diameter]) {
    chord_angle = deg_over_mm * diameter + angle_offset;
    ring_step_count = (diameter - max_diameter) / step_size;

    approximate_margin_angle = diameter > 20 ? chord_angle / 5 : chord_angle / 2;
    half_steps = floor(180 / (chord_angle + approximate_margin_angle));

    total_chords_angle = half_steps * chord_angle;
    total_margins_angle = 180 - total_chords_angle;
    actual_margin_angle = total_margins_angle / half_steps;
    step_angle = chord_angle + actual_margin_angle;
    rotation_offset = step_angle * 1.5 + (half_steps % 2 == 0 ? ring_step_count * 45 : ring_step_count * 90);

    for (step = [1:half_steps * 2]) {
      rotate(a=rotation_offset + step * step_angle)
        chord_ra(r=diameter / 2, a=chord_angle, offset_in=split_width);
    }
  }
}
