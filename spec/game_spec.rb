require 'date'
require_relative '../classes/game'

describe Game do
  context '... this class...' do
    it 'should initialize with multiplayer, last_played_date and published_date' do
      game = Game.new('22', '2022-06-01', '1960-05-12')
      expect(game.multiplayer).not_to be_nil
      expect(game.last_played_at).to be_a(Date)
      expect(game.publish_date).to eq(Date.parse('1960-05-12'))
    end

    # it 'should detect the book title' do
    #   bk = Book.new('title', 'name', 'cover_state', '2018-05-12')
    #   expect(bk.name).to eq 'title'
    # end

    # it 'should detect the book publisher' do
    #   bk = Book.new('name', 'publisher', 'cover_state', '2018-05-12')
    #   expect(bk.publisher).to eq 'publisher'
    # end

    # it 'should detect the book cover_state' do
    #   bk = Book.new('name', 'author', 'cover_state', '2018-05-12')
    #   expect(bk.cover_state).to eq 'cover_state'
    # end

    # it 'should detect the book publish_date' do
    #   bk = Book.new('name', 'author', 'cover_state', Date.parse('2018-05-12'))
    #   expect(bk.publish_date).to eq(Date.parse('2018-05-12'))
    # end
  end
end
