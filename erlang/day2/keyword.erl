-module(keyword).
-export([find/2]).
-export([first/1]).

first([]) -> [];
first([Head|_]) -> Head.

find(List, Keyword) -> first([Value || {Key, Value} <- List, Key == Keyword]).
