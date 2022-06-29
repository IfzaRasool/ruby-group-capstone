require 'colorize'
require_relative 'modules/game'
require_relative 'modules/author'
require_relative 'classes/game'

class App
  include GameModule
  include AuthorModule

  def initialize
    @options = {
      '1' => 'list all books',
      '2' => 'list all music album',
      '3' => 'list all movies',
      '4' => method(:list_games),
      '5' => 'list all genre',
      '6' => method(:list_authors),
      '7' => 'list all sources',
      '8' => 'list all labels',
      '9' => 'add a book',
      '11' => 'add a movie',
      '12' => method(:create_game),
      '13' => method(:quit_game)
    }
  end

  def handle_options(input)
    if input.to_i.between?(1, 13)
      @options[input].call
    else
      puts 'Invalid Input!'.colorize(color: :red)
    end
  end

  # games
  def create_game
    print 'Enter number of players: '
    multiplayer = gets.chomp

    print 'Enter Last Played Date format[yyyy-mm-dd]: '
    last_played_at = gets.chomp

    print 'Enter Date Published format[yyyy-mm-dd]: '
    publish_date = gets.chomp

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    add_game(new_game)
    puts 'Game created successfully'.colorize(color: :light_green)
  rescue StandardError
    puts 'Cannot create game, check your Input format'.colorize(color: :light_red)
  end

  # movies

  def create_movie
    print 'Enter the movie name '
    movies = gets.chomp

    print 'Enter the Date published with Date format[yyyy-mm-dd]: '
    date_published = gets.chomp

    print 'Please indicate if this is a Silent Movie: '
    silent_movie = gets.chomp
    silent_movie = y_n { 'Silent? [Y/N]:' }
    new_movie = Movie.new(movies, date_published, silent_movie)
    add_movie(new_movie)
    puts 'Movie created successfully'.colorize(color: :light_green)
  rescue StandardError
    puts 'Cannot create movie, check your Input format'.colorize(color: :light_red)
  end

  def list_games
    games = fetch_games
    if games.empty?
      puts 'No Games to be displayed'.colorize(color: :magenta)
    else
      puts "#{games.count} Games Found!".colorize(color: :magenta)
      games.each do |game|
        puts "Players: #{game['multiplayer']}" \
             "-Last Played: #{game['last_played_at']} - Published: #{game['publish_date']}"
      end
    end
  end

  # list movies
  def list_all_movies
    if movies.empty?
      puts 'Woops! There are currently no movies in the list.'
    else
      puts
      movies.each do |movie|
        puts "Title: '#{movie.name}, Published_Date: #{movie.publish_date}, Silent: #{movie.silent}"
      end
      puts ''
    end
  end

  # authors
  def list_authors
    authors = fetch_authors

    if authors.empty?
      puts 'No Authors to be displayed'.colorize(color: :magenta)
    else
      puts "#{authors.count} Authors Found!".colorize(color: :magenta)
      authors.each do |author|
        puts "First Name: #{author['first_name']} - Last Name: #{author['last_name']}"
      end
    end
  end

  # quit game
  def quit_game
    puts 'Application exited successfully!'.colorize(color: :light_blue)
    exit(true)
  end
end
