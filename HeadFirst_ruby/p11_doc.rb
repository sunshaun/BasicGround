# practice 11: generating documents
# "rdoc <rb_file_name>" command can generate a HTML document
# In documents, "initialize" instance method will appear as "new" classmethod
# "require" import code from other ruby file or library

require "date"
require "./p9_mixin"

p "-" * 22
photo11 = Photo.new
puts photo11

# here is class document
class DocClass
  # here is attribute document
  attr_accessor :doc_attr

  # here is method document
  def doc_method
    puts "doc_method"
  end

  # here is class method document
  def self.classmethod
    puts "class_method"
  end
end

d = DocClass.new
DocClass.classmethod
p d.doc_attr
d.doc_method
