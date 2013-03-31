
List myAverage := method(
  if(isEmpty,
     0,
     sum := 0; foreach(i, num, sum = sum + num); sum / size);
);

(list(1, 4, 8, 12, 16, 20) myAverage) println

(list() myAverage) println

(list(1, 4, "string", "barf") myAverage) println
