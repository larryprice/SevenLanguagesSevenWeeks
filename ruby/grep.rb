
def grep(fname, phrase)
  File.open(fname, 'r') do |f|
    regex = Regexp.new(phrase)
    f.each_with_index do |line, i|
      if line =~ regex
        puts "#{i}: #{line}"
      end
    end
  end
end

grep('tree.rb', 'Tree')

