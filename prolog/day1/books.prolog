wrote('Chuck Palahniuk', 'Airplane').
wrote('Chuck Palahniuk', 'Choke').
wrote('Chuck Palahniuk', 'Fight Club').
wrote('Philip Pullman', 'Northern Lights').
wrote('Philip Pullman', 'The Subtle Knife').
wrote('Philip Pullman', 'The Amber Spyglass').
wrote('Joseph Heller', 'Catch-22').
wrote('SE Hinton', 'The Outsiders').

list_books(Author, Books) :- findall(Book, wrote(Author, Book), Books).
