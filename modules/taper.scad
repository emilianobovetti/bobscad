module taper(x_shear = 0, y_shear = 0, convexity = 1) render(convexity = convexity) intersection() {
  multmatrix(m = [
    [1, 0, x_shear, 0],
    [0, 1, 0,       0],
    [0, 0, 1,       0]
  ]) children();

  multmatrix(m = [
    [1, 0, -x_shear, 0],
    [0, 1, 0,        0],
    [0, 0, 1,        0]
  ]) children();

  multmatrix(m = [
    [1, 0, 0,       0],
    [0, 1, y_shear, 0],
    [0, 0, 1,       0]
  ]) children();

  multmatrix(m = [
    [1, 0, 0,        0],
    [0, 1, -y_shear, 0],
    [0, 0, 1,        0]
  ]) children();
}
