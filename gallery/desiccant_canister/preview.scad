include <./params.scad>

use <./canister.scad>
use <./canister_lid.scad>

module canister_with_lid() {
  canister();

  translate([0, 0, base_height + wall_height])
    lid();
}

*intersection() {
  canister_with_lid();

  linear_extrude(height=100)
    polygon(points=[[-100, 0], [100, 0], [100, 100], [-100, 100]]);
}

canister_with_lid();
