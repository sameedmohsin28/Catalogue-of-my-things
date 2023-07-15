require_relative '../classes/games/author'
require_relative '../classes/games/game'

RSpec.describe Author do
  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:author) { Author.new(first_name, last_name) }
  let(:game) { Game.new('2000/03/04', '2019/09/09', true) }

  describe 'constructor' do
    it 'creates new Author object with the given name' do
      expect(author.first_name).to eq(first_name)
      expect(author.last_name).to eq(last_name)
    end
  end

  describe 'add_item' do
    it 'adds a game item to the author' do
      author.add_item(game)
      expect(author.items).to include(game)
      expect(game.author).to eq(author)
    end
  end
end
