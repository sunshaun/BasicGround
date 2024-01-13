# practice 8: variable reference
# when I assgin variable, array, hash etc... It just store a reference of object rather than object itself
# .object_id : show unique identifier of object (use .inspect works too)
#
# In Ruby, the value of an assignment expression is ths value that is assigned
# So if last line of the block is assignment experssion, there is no need return again the value for that
#
# two rules for the hash default object when using:
# 1. there is no need to modify default object (btw Integer object is unmutable)
# 2. ensure assginment to the hash
#
# Choosing between a default object and default block:
# Generally, opt for using a default object when the hash's default value is Integer type, And
# for other types, prefer using a default block
# using ".default" to get hash's default value

class CelestialBody
  attr_accessor :type, :name
end

main_body = CelestialBody.new
main_body.type = "planet"
bodies = Hash.new(main_body)
p main_body

# !! It not be assigned, just access the reference of default object
# bodies is {} (actually, It's calling attr_accessor "name= ", And
# modify reference of defalut object)
bodies["Mars"].name = "Mars"
bodies["Venus"].name = "Venus"
puts bodies
p main_body

# So pass a block to the hash as the default setting
# this block reveice to param: a reference of hash, and a key accessed
bodies = Hash.new do |hash, key|
  body = CelestialBody.new
  body.type = "planet"
  hash[key] = body
end
bodies["Mars"].name = "Mars"
bodies["Venus"].name = "Venus"
puts bodies

foods = Hash.new { |hash, key| [] }
foods["A"] << "Apple"
foods["A"] << "Avocado"
foods["B"] << "Bacon"
foods["B"] << "Bread"

p foods["A"]
p foods["B"]
p foods
