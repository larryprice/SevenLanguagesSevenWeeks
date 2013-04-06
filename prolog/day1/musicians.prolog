plays('Dave Grohl', 'drums').
plays('Matt Hommes', 'guitar').
plays('John Paul Jones', 'bass').
plays('Buckethead', 'guitar').
plays('John Coltrane', 'Saxophone').
plays('Louis Armstrong', 'Trumpet').

genre('Dave Grohl', 'Rock').
genre('Matt Hommes', 'Rock').
genre('John Paul Jones', 'Rock').
genre('Buckethead', 'Instrumental').
genre('John Coltrane', 'Jazz').
genre('Louis Armstrong', 'Jazz').

instrument_players(Instrument, Players) :- findall(Player, plays(Player, Instrument), Players).
