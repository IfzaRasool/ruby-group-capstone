require 'colorize'
require_relative 'modules/game'
require_relative 'modules/author'
require_relative 'classes/game'
require_relative 'modules/genre'
require_relative 'modules/music_album'
require_relative 'classes/music_album'

class App
  include GameModule
  include AuthorModule
  include GenreModule
  include MusicAlbumsModule

  def initialize
    @options = {
      '1' => 'list all books',
      '2' => method(:list_all_music_albums),
      '3' => 'list all movies',
      '4' => method(:list_games),
      '5' => method(:list_genres),
      '6' => method(:list_authors),
      '7' => 'list all sources',
      '8' => 'list all labels',
      '9' => 'add a book',
      '10' => method(:create_music_album),
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
    # rescue StandardError
    #   puts 'Cannot create game, check your Input format'.colorize(color: :light_red)
  end

  def list_games
    games = fetch_games
    if games.empty?
      puts 'No Games to be displayed'.colorize(color: :magenta)
    else
      puts "#{games.count} Games Found!".colorize(color: :magenta)
      games.each do |game|
        puts "Players: #{game['multiplayer']}" \
             " - Last Played: #{game['last_played_at']} - Published: #{game['publish_date']}"
      end
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

  # music album
  def create_music_album
    print 'Enter Date Published format[yyyy-mm-dd]: '
    publish_date = gets.chomp

    print 'Do you want it to be on spotify?(y/n): '
    on_spotify = gets.chomp
    on_spotify = on_spotify.casecmp?('y')

    music_album = MusicAlbum.new(publish_date, on_spotify)

    add_music_album(music_album)
    puts 'Music Album Added successfully'.colorize(color: :light_green)
  rescue StandardError
    puts 'Cannot add music album, check your Input format'.colorize(color: :light_red)
  end

  def list_all_music_albums
    music_albums = fetch_music_albums

    if music_albums.empty?
      puts 'No Music Album to be displayed'.colorize(color: :magenta)
    else
      music_albums.each do |album|
        puts "Album's published date : #{album['publish_date']}"
        puts "The album is #{album['on_spotify'] ? '' : 'not'} on spotify"
      end
    end
  end

  # list all Genres

  def list_genres
    genres = fetch_genres
    if genres.empty?
      puts 'No Genres to be displayed'.colorize(color: :magenta)
    else
      print 'The genres are : '
      genres.each do |genre|
        print genre.name
      end
    end
  end
end
