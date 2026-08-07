function profile1(x, a = 0.3) =
  min(x, 1 - x, a);

function profile2(x, a = 0.2, b = 0.3) =
  max(min(x, 1 - b - x, a), 0);

module trace_profile() polygon(points=[for (x = [0:0.001:1]) [x, profile2(x)]]);

module profile2_polygon(r = 1, td = 1) {
  teeth_depth = td;
  r_mult = teeth_depth * 5;

  polygon(
    points=[
      for (angle = [0:$fa:360]) let (
        radius = r + r_mult * profile2(angle / 360),
        x = radius * cos(angle),
        y = radius * sin(angle)
      ) [x, y],
    ]
  );
}

// █████
// ████████
// ███████████
// ██████████████
// █████████████████
// ████████████████████
// ███████████████████████  ^
// ███████████████████████  ¦
// ███████████████████████  th
// ███████████████████████  ¦
// ███████████████████████  v
// ████████████████████
// █████████████████
// ██████████████
// ███████████
// ████████
// █████ <----- td ----->

module extrude_thread_profile(h = 1, th = 1.2) {
  teeth_height = th;

  linear_extrude(height=h, twist=-360 * h * 0.4 / teeth_height) children();
}

module external_threads(r = 1, h = 1, th = 1.2, td = 1, r_off = 0) {
  extrude_thread_profile(h=h, th=th) profile2_polygon(r=r + r_off, td=td);
}

module internal_threads(r = 1, h = 1, th = 1.2, td = 1, r_off = 0.4) {
  difference() {
    if ($children > 0)
      children();
    else
      cylinder(h=h + 1, r=r + r_off + 2 * td);

    translate([0, 0, -0.001])
      external_threads(r=r, h=h, th=th, td=td, r_off=r_off);
  }
}
