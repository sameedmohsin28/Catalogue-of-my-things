require_relative '../classes/genre'

RSpec.describe Genre do
  describe '#add_item' do
    it 'associates the genre with the item' do
      genre = Genre.new('Rock')
      item = Item.new('2023-01-01')

      genre.add_item(item)

      expect(item.genre).to eq(genre)
    end

    it 'adds the item to the genre' do
      genre = Genre.new('Rock')
      item = Item.new('2023-01-01')

      genre.add_item(item)

      expect(genre.items).to include(item)
    end
  end
end
