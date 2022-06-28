class App
  def initialize
    @options = {
      '1': 'list all books',
      '2': 'list all music album',
      '3': 'list all movies',
      '4': 'list all games',
      '5': 'list all genre',
      '6': 'list all authors',
      '7': 'list all sources',
      '8': 'list all labels',
      '9': 'add a book',
      '11': 'add a movie',
      '12': 'add a game',
      '13': 'Exit'
    }
  end

  def handle_options(input)
    if input.to_i.between?(1, 13)
      if @options[input] == 'Exit'
        exit(true)
      else
        puts @options[input]
      end
    else
      puts 'Invalid Input!'
    end
  end
end
