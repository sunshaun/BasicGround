# practice 4: initialization
# formating function: format("text and %s %i %f", arg1, arg2, args3)
#
# "self" keyword: referencing an instance within a class, like: self.info. And
# receiver default is self when not using "." operator, meaning "self." could be omitted
#
# use "super" in subclass's initialize method, can effectively eliminate redundant code
# if inheriting superclass's initialize method, ensure to pass the correct number of parameters in super()
#
# class method head define: def self.classmthod_name
#

class Employee
  attr_reader :name, :salry
  def self.intro
    puts "Hi there, It's Employee"
  end

  def initialize(name = "Anonymous", salary = 0)
    self.name = name
    self.salary = salary
  end

  def name=(name)
    if name == ""
      raise "name setting error: blank"
    end
    @name = name
  end

  def salary=(salary)
    @salary = salary.to_i
    if salary < 0
      raise "salary setting error: less than 0"
    end
    @salary = salary
  end

  def info
    puts format "Information: name: #{@name}"
  end
end

class SalariesMan < Employee
  def info
    super
    puts format "daily aventage salary: $%.2f", @salary / 365.0
  end
end

class HourlyMan < Employee
  attr_reader :hours_week

  def initialize(name, salary, hours_week)
    super(name, salary)
    self.hours_week = hours_week
  end

  def hours_week=(hours_week)
    @hours_week = hours_week.to_i
    if hours_week < 0
      raise "hours setting error in class HourlyMan"
    end
    @hours_week = hours_week
  end

  def info
    super
    puts format "this week salary: $%.2f", @salary * hours_week
  end
end

jack = Employee.new
jack.name = "Jack"
jack.salary = 300000
jack.info

july = SalariesMan.new("July", 34000)
jim = HourlyMan.new("Jim", 20000, 30)
july.info
jim.info
Employee.intro
