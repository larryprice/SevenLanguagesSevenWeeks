
Number setSlot("div", Number getSlot("/"));

Number / := method(arg,
  if(arg == 0, 0, self div(arg))
);

(100 / 5) println
(100 / 4) println
(100 / 3) println
(100 / 2) println
(100 / 1) println
(100 / 0) println
