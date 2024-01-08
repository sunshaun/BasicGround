# practice 3: subclass uses inheritance to get property and methods from superclass but
# does not inherit instance variables, because instance variables belong to object
# can use .instance_variables method(all ruby objects haved) to prove it
#
# In subclass, use keyword "super" can calling same name method from superclass
# "super" can passing arguments too: super(arg), using just like a function
# but "super" and "super()" not same, the former haved arguments, the latter has no.
#
# Object class is superclass for all classes

# Vehicle is superclass
class Vehicle
  attr_accessor :odometer
  attr_accessor :gas_used

  attr_accessor :series_name

  def accelerate
    puts "starting accelerate"
  end

  def sound_horn
    puts "Beep!!!!!"
    "b"
  end

  def steer
    puts "Turn front 2 wheels."
  end

  def mileage
    @odometer / @gas_used
  end
end

class Car < Vehicle
  attr_accessor :items
  def car_load(item)
    puts "Car(#{series_name}) is loading #{item}..."
    @items = item
    puts "#{item} is loaded"
  end
end

class Truck < Vehicle
end

class Motocycle < Vehicle
  def to_s
    "#{@series_name} the motocycle"
  end

  def steer
    puts "Turn front wheel"
  end

  def sound_horn
    tmpo = super
    puts "#{tmpo} and bling-bling"
  end
end

vk = Car.new
vk.series_name = "Golf"
vk.car_load("eggs")

mt = Motocycle.new
mt.series_name = "BM"
puts mt
# puts Car.superclass.superclass.superclass
