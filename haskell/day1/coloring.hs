module Main where
  coloring = [[("Alabama", al), ("Mississippi", ms), ("Georgia", ga), ("Tennessee", tn), ("Florida", fl)] | 
    al <- ["red", "green", "blue"],
    ms <- ["red", "green", "blue"],
    ga <- ["red", "green", "blue"],
    tn <- ["red", "green", "blue"],
    fl <- ["red", "green", "blue"],
    ms /= tn,
    al /= ms,
    al /= tn,
    al /= ga,
    al /= fl,
    fl /= ga,
    ga /= tn]