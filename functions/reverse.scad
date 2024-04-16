function reverse(lst) =
  let(max = len(lst) - 1) [for(idx = [0 : max]) lst[max - idx]];
