require 'json'

module GameModule
  def add_game(game)
    game_db = './json/games.json'
    games = []
    new_game = {
      'multiplayer' => game.multiplayer,
      'last_played_at' => game.last_played_at,
      'publish_date' => game.publish_date
    }

    games = JSON.parse(File.read(game_db)) if File.exist?(game_db)

    games << new_game
    File.write(game_db, JSON.pretty_generate(games))
  end

  def fetch_games
    game_db = './json/games.json'
    games = []

    if File.exist?(game_db)
      if File.empty?(game_db)
        games
      else
        JSON.parse(File.read(game_db))
      end
    else
      games
    end
  end
end
