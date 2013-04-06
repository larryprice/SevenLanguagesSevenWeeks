min([Head|[]], Head).
min([Head1|[Head2|[]]], Result) :- (Head1 < Head2 -> Result = Head1; Result = Head2).
min([Head|Tail], Result) :- min(Tail, Result1), min([Head, Result1], Result).