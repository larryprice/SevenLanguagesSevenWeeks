
2dAdd := method(l,
  sum := 0
  l foreach(i, sublist,
            sublist foreach(j, num, sum = sum + num));
  sum
);

2dAdd(list(list(1, 2, 3), list(2, 3, 4), list(3, 4, 5))) println
