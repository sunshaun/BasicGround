# practice 3: subclass uses inheritance to get property and methods from superclass

# Vehicle is superclass
class Vehicle
  attr_accessor :odometer
  attr_accessor :gas_used

  def accelerate
    puts "starting accelerate"
  end

  def sound_horn
    puts "Beep!!!!!"
  end

  def steer
    puts "Turn front 2 wheels."
  end

  def mileage
    @odometer / @gas_used
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

class Motocycle < Vehicle
end
