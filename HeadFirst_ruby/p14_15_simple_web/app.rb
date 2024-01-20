# ERB is Embedded Ruby, run ruby code in ".erb" file
# <%= %> : output embedded tag, calculate ruby code and output to current file
# <% %> : normal embedded tag, just caculate, no input, used to condition expression or loop

require "sinatra"
require "movie"
require "yaml"
require "movie_store"

store = MovieStore.new("movie.yaml")
get("/") do
  @movies = store.all
  erb :index
end

get("/movies/new") do
  erb :new
end

post("/movies/create") do
  @movie = Movie.new
  @movie.title = params["title"]
  @movie.director = params["director"]
  @movie.year = params["year"]
  store.save(@movie)
  redirect "/"
end

# This router must be last
get("/movies/:id") do
  @movie = store.find(params["id"].to_i)
  erb :show
end
