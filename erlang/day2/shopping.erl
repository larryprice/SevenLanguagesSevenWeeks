-module(shopping).
-export([build_list/1]).

build_list(List) -> [{Item, Price * Quantity} || {Item, Quantity, Price} <- List].
