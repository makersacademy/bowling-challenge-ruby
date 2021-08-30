require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  let(:player) { instance_double(Player) }
  let(:game) { Game.new(player) }

  describe '#initialize' do
    it 'should initialize with empty scores array' do
      expect(game.scores).to eq([])
    end

    it 'should require a player argument' do
      expect{ Game.new }.to raise_error ArgumentError
    end
  end
end