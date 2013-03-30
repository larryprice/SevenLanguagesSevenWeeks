#! /usr/bin/ruby

num = Random.rand(10)

puts "Guess a number between 1 and 10"

until (guess = gets).to_i == num do
  unless guess =~ /^\d+$/
    puts "Da's no number, you fool!"
  else
    puts "Guess too low" if guess.to_i < num
    puts "Guess to high" if guess.to_i > num
  end
end

puts "Da's right! Num was #{num}"
