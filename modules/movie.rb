require 'json'

module MovieModule
  def add_movie(movie)
    movie_storage = './json/movies.json'
    movies = []
    new_movie = {
      'name' => movie.name, 'publish_date' => movie.publish_date, 'silent' => movie.silent
    }

    movies = JSON.parse(File.read(movie_storage)) if File.exist?(movie_storage)
    movies << new_movie
    File.write(movie_storage,JSON.pretty_generate(movies))
  end

  

  # def load_movies
  #   file = 'movies.json'
  #   if File.exist? file
  #     File.open(file)
  #     JSON.parse(File.read(file)).map do |movie|
  #       new_movie = Movie.new(movi['publish_date'], ['silent'], movie['archived'], movie['name'])
  #       new_movie.id = movie['id']
  #       @movies.push(new_movie)
  #     end
  #   else
  #     File.new(file, 'w') []
  #   end
  # end
end
