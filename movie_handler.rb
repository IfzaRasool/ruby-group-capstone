require_relative './classes/movie'

class MovieHandler
  attr_accessor :movie

  include Input
  def initialize
    @movies = []
    @sources = []
  end

  def create_source
    print 'Source:'
    source_name = gets.chomp
    Source.new(source_name)
  end

  def add_movie
    puts ''
    print 'Movie name: '
    name = gets.chomp
    print 'Published date: '
    publish_date = gets.chomp

    silent = y/n {'Silent? [Y/N]:'}

    archived = y/n {'Archicved? [Y/N]'}

    source = create_source
    movie = Movie.new(name, publish_date, silent, archived,) source.add_item(movie)
    @sources.push(source) unless @sources.include?(source)
    @movies.push(movie)

   puts ''
   puts 'Successfully added the movie!'
   puts ''
  end

  def list_all_movies
    if @movies.empty?
      puts 'Woops! There are currently no movies in the list.'
    else
      puts
      @movies.each do |movie|
        puts "Title: '#{movie.name}, Published_Date: #{movie.publish_date}, Silent: #{movie.silent}"
      end
      puts ''
    end
  end

  def list_all_sources
    if @sources.any?
      puts ''
      puts 'Here are the sources: '
      @sources.each_with_index { |source, index| puts "#{index}) ID: #{source.id}, Name: '#{source.name}'" }
      puts ''
    else
      puts 'No source details to show'
    end
  end

  def save_movies
    movies = @movies.map do  |movie|
      movie.to_obj(movie.id, movie.name, movie.publish_date, movie.silent, movie.Archicved)
      
      File.write('movies.json', JSON.generate(movies), mode: 'w')
    end

    def load_movies
      file = 'movies.json'

      if File.exist? file
        File.open(file)
        JSON.parse(File.read(file)).map do |movie|
          new_movie = Movie.new(movie['publish_date'],['silent'], movie['archived'], movie['name'])
          new_movie.id = movie['id']
          @movies.push(new_movie)
        end
      else
        File.new(file, 'w') []
      end
    end

    def load_sources
      file = 'sources.json'

      if File.exist? file
        File.open(file)
        JSON.parse(File.read(file)).map do |source|
          new_source = Source.new(source['name'])
          new_source.id = source['id']
          new_source.items = source['items']
          @sources.push(new_source)
        end
      else
        File.new (file, 'w')
        []
      end
    end
  end
  