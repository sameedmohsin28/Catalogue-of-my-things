require_relative '../classes/games/game'

RSpec.describe Game do
  let(:publish_date) { '2000/08/09' }
  let(:last_played_at) { '2021/01/01' }
  let(:multiplayer) { true }
  let(:game) { Game.new(publish_date, last_played_at, multiplayer) }

  describe 'constructor' do
    it 'creates new Game object with the given parameters' do
      expect(game.publish_date).to eq(publish_date)
      expect(game.last_played_at).to eq(last_played_at)
      expect(game.multiplayer).to eq(multiplayer)
    end
  end

  describe 'can_be_archived?' do
    it 'shows whether game is archived or not' do
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
