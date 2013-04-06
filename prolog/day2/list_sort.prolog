min([Head|[]], Head).
min([Head1|[Head2|[]]], Result) :- (Head1 < Head2 -> Result = Head1; Result = Head2).
min([Head|Tail], Result) :- min(Tail, Result1), min([Head, Result1], Result).

remove(X, [X|R], R).
remove(X, [F|R], [F|S]) :- remove(X,R,S).

list_sort([], []).
list_sort([Head|[]], [Head]).

list_sort(List, Result) :-
  min(List, Min),
  remove(Min, List, NewList),
  list_sort(NewList, Sorted),
  append([Min], Sorted, Result).