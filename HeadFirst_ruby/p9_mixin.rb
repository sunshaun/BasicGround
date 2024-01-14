# practice 9: Mixin the module using
# instance variable in module belong to instance of class that mixing this module
# AA || BB using: return AA if AA is true, else return BB
# AA ||= BB using: assign BB to AA if AA is false(or nils), else just return AA
#
# methods covered: if define a same name method when mixin module,
# the method will be covered according to ancestors sequence, note the "initialize" method
# In general, class method covers mixin method, mixin method covers superclass method

module GetComments
  def comments
    @comments ||= []
  end

  def add_comment(comment)
    comments << comment
  end
end

class Clip
  def play
    puts "Playing #{object_id}"
  end
end

class Video < Clip
  include GetComments
  attr_accessor :resolution
end

class Song < Clip
  include GetComments
  attr_accessor :bpm
end

class Photo < Clip
  include GetComments
  def initialize
    @format = "BMP"
  end
end

video = Video.new
video.add_comment("It's classic")
song = Song.new
song.add_comment("Choir is perfect!")

p video, song
# .ancestors can show list of searching methods sequence
p Video.ancestors
photo = Photo.new
photo.add_comment("nice pic")
p photo
