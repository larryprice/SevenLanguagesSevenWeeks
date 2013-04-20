-module(error).
-export([find/1]).

find(success) -> io:fwrite("success~n");
find({error, Message}) -> io:fwrite("error: ~s~n", [Message]).
