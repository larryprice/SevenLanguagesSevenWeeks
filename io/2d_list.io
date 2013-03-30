TwoDList := List clone
TwoDList dim := method(x, y,
                   l := TwoDList clone;
                   for(i, 1, y, l append(List clone setSize(x)));
);

TwoDList get := method(x, y,
                     at(y) at(x)
);

TwoDList set := method(x, y, value,
                       atPut(y, (at(y) atPut(x, value)))
);

TwoDList transpose := method(original,
            new_matrix := TwoDList dim(original size,
                                       original first size);
            for(i,
                0,
                (original first size) - 1,
                for(j,
                    0,
                    (original size) - 1,
                    new_matrix set(j,
                                   i,
                                   original get(i, j))))
);

TwoDList write_to_file := method(fileName,
      file := File open(fileName);
      file setContents("");
      file := File open(fileName);
      for(i,
          0,
          size - 1,
          for(j,
              0,
              (first size) - 1,
              file write((at(i) at(j)) asString);
              file write(","));
          file write("\n"));
      file close;
);

TwoDList read_from_file := method(fileName,
      new_matrix := TwoDList clone;
      file := File open(fileName);
      file readLines foreach(i,
            line,
            new_matrix append(List clone);
            line splitNoEmpties(",") foreach(j,
                                             value,
                                             new_matrix at(i) append(value)));
      file close;
      new_matrix;
);

# Dim functionality
myList := TwoDList dim(3, 4)
myList println

# get functionality
(myList get(1, 1)) println

# set functionality
myList set(1, 2, 0)
myList println

# set everything to show off
for(i,
    0,
    (myList size) - 1,
    for(j,
        0,
        ((myList at(i)) size) - 1,
        myList set(j, i, i + j)))

myList println

# transpose
newList := TwoDList transpose(myList)
newList println

# write matrix to file
newList write_to_file("temp.txt")
readList := TwoDList read_from_file("temp.txt")
readList println
