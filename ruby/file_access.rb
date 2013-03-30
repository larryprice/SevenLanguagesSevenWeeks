
# code block closes file for you
File.open('temp.txt', 'a') {|f| f.write("#{__LINE__}\n")}

# i have to close my own file. :(
file = File.open('temp.txt', 'r+')
lines = file.readlines
file.write("#{__LINE__.to_s} - read '#{lines.join(',').gsub(/\n+/, ' ')}'\n")
file.close
