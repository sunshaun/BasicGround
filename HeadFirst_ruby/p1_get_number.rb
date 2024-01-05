# practice 1: get number

# # puts and print:
# they are all output string, but little different
# puts means put string, and automatically add "\n" at the end (but print have no "\n")
# .chomp method can delete "\n" at the end

# # gets: get string(have to type transfer if Int needed), load a line from std input
# when using the to_i function, all non-numberic character following the number are ignored

# #{...}: used for formatting, "..."can be a variable or any ruby expression

# # how to check object information:
# use .inspect method or p method:
# puts input.inspect ||  p input
#
# find out object's methods or class: .methods .class

## when use "+" connect object, same type needed(or use #{...})
# 100.to_s + "gold"

# init welcome
puts "Welcome to 'Get Number Game'"
print "What's your name?"
input = gets
puts "Welcome, #{input.chomp}!"

# number generator
puts "I've got a number between 1 and 100"
puts "Can u guess it?"
target = rand(1..100)

# correct flag
flag_guess = false

# guess times
num_guesses = 0

# loop
until num_guesses == 10 || flag_guess
  puts "Now you have #{10 - num_guesses} guesses left."
  puts "Make a Guess:"
  guess = gets.to_i
  num_guesses += 1
  if guess > target
    puts "your guess was too hight"
  elsif guess < target
    puts "your guess was too low"
  else
    flag_guess = true
    puts "Good job, you guess right, number is #{target}"
  end
end
unless flag_guess
  puts "Sorrt, you didn't guess correctly"
end
