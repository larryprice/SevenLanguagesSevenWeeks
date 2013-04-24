-module(translate_service).
-behavior(supervisor).
-export([loop/0, translate/1]).
-export([init/1, start/0]).

loop() ->
  receive
    {From, "casa"} ->
      From ! "house",
      loop();
    {From, "blanca"} ->
      From ! "white",
      loop();
    {From, _} ->
      From ! "I don't understand.",
      erlang:raise(exit, "Exiting...", [])
  end.

translate(Word) ->
  translator ! {self(), Word},
  receive
    Translation -> Translation
  end.

start() ->
  io:fwrite("Starting...~n"),
  register(translator, spawn_link(translate_service, loop, [])),
  {ok, whereis(translator)}.

init(_) ->
  {ok, {{one_for_one, 60, 60},
    [{translate_service, {translate_service, start, []},
      permanent, brutal_kill, worker, [translate_service]}]}}.
