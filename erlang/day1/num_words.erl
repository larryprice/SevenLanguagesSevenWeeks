-module(num_words).
-export([num_words/1]).

num_words("") -> 0;
num_words(Sentence) -> num_words(string:strip(string:substr(Sentence, string:cspan(Sentence, " ")+1))) + 1.
