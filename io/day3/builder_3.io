Builder := Object clone

Builder forward := method(
  lastArg := call evalArgAt(-1)
  lastArg type println
  if(lastArg type == "Number",
     depth := lastArg,
     depth := 0)
  writeln(" " repeated(depth), "<", call message name, ">")
  call message arguments foreach(
        arg,
        content := self doMessage(arg, depth + 1);
        if(content type == "Sequence", writeln(content)))
  writeln(" " repeated(depth), "</", call message name, ">"))

Builder ul(
  li("Io"),
  li("Lua"),
  li("Javascript"), 0
)

"doesn't work" println
