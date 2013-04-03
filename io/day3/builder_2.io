
Builder := Object clone

Builder forward := method(
  result := "<" .. (call message name) .. ">" .. "\n"
  call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", 
           content split("\n") foreach(line, result := result .. " " .. line .. "\n")))
  result := result .. "</" .. (call message name) .. ">"
)

Builder ul(
  li("Io"),
  li("Lua"),
  li("Javascript")
) println
