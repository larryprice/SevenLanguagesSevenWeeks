
a = (1..16).to_a


puts "# using each"
a_slice = []
a.each do |x|
  a_slice << x
  if a_slice.count == 4
    p a_slice
    a_slice = []
  end
end

puts "# using each_slice"

a.each_slice(4) { |a_slice2| p a_slice2}
