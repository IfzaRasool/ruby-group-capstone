require_relative '../classes/genre'

describe Genre do
  context 'Given an ' do
    it 'adds the name of the genre' do
      genre = Genre.new('rock')
      expect(genre.name).to_not be_empty

    end
  end
end