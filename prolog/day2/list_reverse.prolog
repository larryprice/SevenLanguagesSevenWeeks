list_reverse([], []).
list_reverse([Head|Tail1], Result) :- list_reverse(Tail1, Temp), append(Temp, [Head], Result).