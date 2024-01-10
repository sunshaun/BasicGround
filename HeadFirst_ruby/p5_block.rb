# practice 5: block
# block is code blcok, can called in method that bind a blcok
# define keyword "do": <method_name> do ... end (if passing arguments: <method_name> |arg1, arg2|)
# define method: def method_name(&my_block):... end
# called in method: my_block.call
#
# above is classic solution to receive block, but there is a better alternative:
# "method_name(&my_block) and my_block.call" can be substituted with keyword "yield"
# "<method_name> |arg1..| do ... end " also can be substituted with "<method_name> {|arg1..| ...}"

def total(prices)
  amount = 0
  prices.each { |price| amount += price }
  amount
end

def refund(prices)
  amount = 0
  prices.each { |price| amount -= price }
  amount
end

def discounts(prices)
  prices.each do |price|
    amount_off = price * 0.3
    puts format "Now discount: $%.2f", amount_off
  end
end

lst = [100, 400, 500]
p total(lst)
p refund(lst)
p discounts(lst)
