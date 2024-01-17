# practice 12: using raise to capture exception
#
# when pass string to raise method, it will create a "message" attribute in this exception
# Exception is the superclass of all exception, when we define a new exception class, using
# StandardError as superclass
#
# "retry" keyword can return to starting of begin/end block when "rescue" includes "retry"
# "ensure" keyword like "finally", the code always runs

class OverOffError < StandardError
end

class OvenEmptyError < StandardError
end

class SmallOven
  attr_accessor :contents

  def turn_on
    puts "Turning oven on"
    @state = "on"
  end

  def turn_off
    puts "Turning oven off"
    @state = "off"
  end

  def bake
    unless @state == "on"
      raise OverOffError, "You need to turn the oven on first"
    end
    if @contents.nil?
      raise OvenEmptyError, "There's nothing in the oven"
    end
    "Yummy #{contents}"
  end
end

lunch = ["eggs", nil, "pie"]
oven = SmallOven.new
oven.turn_off
lunch.each do |item|
  oven.contents = item
  puts "Serving #{oven.bake}"
rescue OverOffError => exception
  oven.turn_on
  retry
rescue OvenEmptyError => exception
  puts "[Error-02]: #{exception.message}"
ensure
  oven.turn_off
end
