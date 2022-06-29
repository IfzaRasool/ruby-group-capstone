require_relative '../classes/music_album'

describe MusicAlbum do
  context 'Music Album ' do
    it 'on the spotify return true' do
      music_album = MusicAlbum.new('2002-12-12', true)

      expect(music_album.on_spotify).to equal(true)
    end
    # it 'can be archived' do
    #   music_album = MusicAlbum.new('15', true)
    #   expect(music_album.can_be_archived?).to eq(true)
    # end
  end
end
