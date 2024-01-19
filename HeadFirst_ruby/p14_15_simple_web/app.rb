# ERB is Embedded Ruby, run ruby code in ".erb" file
# <%= %> : output embedded tag, calculate ruby code and output to current file
# <% %> : normal embedded tag, just caculate, no input, used to condition expression or loop

require "sinatra"
require "movie"

get("/") do
  @movies = []
  5.times do |i|
    @movies[i] = Movie.new
    @movies[i].title = "Number." + i.to_s
  end
  p @movies
  erb :index
end

get("/movies/new") do
  erb :new
end
