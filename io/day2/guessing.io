

"I'm thinking of a number between 1 and 100..." println

rand := Random value(100) floor + 1

stdio := File standardInput

"What number am I thinking of?" println

delta := 100
oldInput := 100

for(i, 1, 10,
  input := (stdio readLine) asNumber

  if(input == rand,
     "Yeah! " print; input print; " was the right number! Who da man? You da man!" println; break,
     "Wrong. You have " print; (10 - i) print; " guesses left." println)

  newDelta := (rand - input) abs;
  
  if(i > 1 and i != 10,
     if(newDelta > delta,
        "Colder" println,
        if(input != oldInput,
           "Hotter" println,
           "That's the same number, friend. Do you understand how this game works?" println)));
  
  delta = newDelta;
  oldInput = input;
);

stdio close


