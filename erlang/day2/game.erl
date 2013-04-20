-module(game).
-export([winner/1]).
-export([tic_tac_toe/1]).
-export([first/1]).

first({First,_,_}) -> First.

tic_tac_toe(Board) ->
  case winner(Board) of
    [Head|_] -> io:fwrite("~s wins!~n", [first(Head)]);
    _ ->
      case lists:any(fun(X) -> X == "" end, Board) of
        true -> io:fwrite("no winner~n");
        false -> io:fwrite("cat~n")
      end
    end.


winner(List) -> [A,B,C,D,E,F,G,H,I] = List,
  lists:filter(fun({X, Y, Z}) -> (not (X == "")) and (X == Y) and (Y == Z) end,
    [{A,B,C}, {D,E,F}, {G,H,I}, {A,D,G}, {B,E,H}, {C,F,I}, {A,E,I}, {C,E,G}]).
