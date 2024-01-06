# practice 2: Class and instance
# new instance: .new
# instance variable: @my_var
# a data_writer named can use "="("?", "!" also), "=" is part of the name : xx_writer=("data"), and
# Ruby have convenient methods to do that: attr_writer, attr_reader, attr_accessor

def foo
  puts "this is foo function!"
end

def bar(item)
  puts "i'm bar, and i have a parameter: #{item}"
end

class Mage
  attr_accessor :name, :spell

  def enchant(target)
    puts "#{@name} casts #{@spell} on #{target.name}!"
  end
end

class Num
  attr_reader :age
  def age=(age)
    if age > 100
      raise "its wrong, too much"
    end
    @age = age
  end
end
