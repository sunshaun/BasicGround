# practice 10: buildin module and mixin using
#
# about constant: In Ruby, names starting with uppercase letters are threated as constant, and
# according to convention, constant names should be wiritten in all uppercase
# Comparable module depends on the "<=>" method that we support, mixin with String, Integer...(value type)
# Enumerable module depends on the "each" mechod that we support, mixin with Array, Hash...(collection type)

class Steak
  include Comparable
  GRADE_SCORES = {"High" => 3, "Medium" => 2, "Low" => 1}

  attr_accessor :grade

  def >(other)
    GRADE_SCORES[grade] > GRADE_SCORES[other.grade]
  end

  def <=>(other)
    if GRADE_SCORES[grade] < GRADE_SCORES[other.grade]
      -1
    elsif GRADE_SCORES[grade] == GRADE_SCORES[other.grade]
      0
    else
      # GRADE_SCORES[grade] > GRADE_SCORES[other.grade]
      1
    end
  end
end

h = Steak.new
l = Steak.new
m = Steak.new
h.grade = "High"
l.grade = "Low"
m.grade = "Medium"

p h <=> l
p m.between?(l, h)

class WordSplitter
  include Enumerable
  attr_accessor :string
  def each
    string.split(" ").each do |word|
      yield word
    end
  end
end

spl = WordSplitter.new
spl.string = "how do you do"
p spl.find_all { |w| w.include?("d") }
p spl.to_a