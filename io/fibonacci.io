# recursive
fibonacci := method(arg,
    if(arg <= 1, 1, fibonacci(arg-1) + fibonacci(arg-2))
)

"Recursive impelmentation" println
list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12) foreach(i, func, fibonacci(i) println)

#iterative
fibonacci := method(arg,
    if(arg < 2, 1, 
       sum := 0; prevSum := 1; prevPrevSum := 0; for(i, 2, arg+1, sum = prevSum + prevPrevSum; prevPrevSum = prevSum; prevSum := sum;); sum)
)

"Iterative implementation" println
list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12) foreach(i, func, fibonacci(i) println)
