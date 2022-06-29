require 'json'

module GenreModule
  def add_genre(genre)
    genre_db = './json/genres.json'
    genres = []
    new_genre = {
      'name' => genre.name
    }

    genres = JSON.parse(File.read(genres_db)) if File.exist?(genres_db)

    genres << new_genre
    File.write(genre_db, JSON.pretty_generate(genres))
  end

  def fetch_genres
    genre_db = './json/genres.json'
    genres = []

    if File.exist?(genre_db)
      if File.empty?(genre_db)
        genres
      else
        JSON.parse(File.read(genre_db))
      end
    else
      genres
    end
  end
end
