# practice 6: more about block
#
# File processing methods:
# open(using a block can auto close file when function finished)
# find_all(using a block to process each element of array and return a array)
# e.g.: items.find_all(|item| item.length > 3) // return a array element length > 3
#
# all blocks return the value of their last expression
# ".map" method can receive an original array, pass it to a block for processing, and then return a array

lines = []

File.open("p6.txt") do |f|
  lines = f.readlines
end

def my_method
  puts "staring..."
  a = yield
  puts "a = #{a}"
  puts "done"
end

my_method do
  puts "1.2"
  "1.2"
end

my_method do
  puts "1.4"
end

res_lines = lines.find_all { |line| line.include?("Truncated") }
res_lines = res_lines.reject { |line| line.include?("--") }
puts res_lines

# simple e.g
def find_all
  items = []
  each do |item|
    if yield(item)
      items << item
    end
  end
  items
end

# [1, 2, 3, 4, 5].find_all { |p| p % 2 == 0 }
# output: [2, 4]

# simple map e.g.
def m_map
  result_array = []
  each do |p|
    result_array << yield(p)
  end
  result_array
end

"apple-better-chating-dong-editing".split("-").map do |p|
  puts p if p.include?("ing")
end
