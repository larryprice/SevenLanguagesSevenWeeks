
# hash to array
my_hash = {:fish => :sticks, :horse => :glue, :cow => :fertilizer}
puts "#{my_hash}.flatten = #{my_hash.flatten}" # creates [:fish, :sticks, :horse, ...]
puts "#{my_hash}.to_a = #{my_hash.to_a}" # creates [[:first, :sticks], [:horse, :glue], [:cow, :fertilizer]]


class Array
  def to_hash
    a = self
    h = {}
    until a.empty? do
      h[a.shift] = a.shift
    end
    
    h
  end
end

my_arr = [:one, "1", :two, "2", :three, "3"]
puts "#{my_arr}.to_hash = #{my_arr.to_hash}"
