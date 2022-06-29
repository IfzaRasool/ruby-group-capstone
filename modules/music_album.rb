require 'json'

module MusicAlbumsModule
  def add_music_album(music_album)
    music_album_db = './json/music_album.json'
    music_albums = []
    new_music_album = {
      'publish_date' => music_album.publish_date,
      'on_spotify' => music_album.on_spotify
    }

    music_albums = JSON.parse(File.read(music_album_db)) if File.exist?(music_album_db)

    music_albums << new_music_album
    File.write(music_album_db, JSON.pretty_generate(music_albums))
  end

  def fetch_music_albums
    music_album_db = './json/music_album.json'
    music_albums = []

    if File.exist?(music_album_db)
      if File.empty?(music_album_db)
        music_albums
      else
        JSON.parse(File.read(music_album_db))
      end
    else
      music_albums
    end
  end
end
