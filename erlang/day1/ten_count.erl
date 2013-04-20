-module(ten_count).
-export([count/1]).
-export([count/0]).

count(10) -> io:fwrite("10~n");
count(N) -> io:fwrite("~w ", [N]), count(N+1).
count() -> count(0).
