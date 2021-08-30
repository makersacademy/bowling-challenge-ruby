require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  let(:player) { instance_double(Player) }
  let(:game) { described_class.new(player) }

  describe '#initialize' do
    it 'should initialize with empty scores array' do
      expect(game.scores).to eq([])
    end

    it 'should require a player argument' do
      expect{ Game.new }.to raise_error ArgumentError
    end
  end

  describe '#score' do
    it 'should record my current score' do
      game.score(6)
      expect(game.last_score).to eq(6)
    end

    it 'should only accept scores from 1-10' do
      expect{ game.score(11) }.to raise_error 'can only accept scores 1-10'
      expect{ game.score(-11) }.to raise_error 'can only accept scores 1-10'
    end
  end

  # describe '#check_bonus' do
  #   it 'should add correct bonus to score if player rolls a spare' do
  #     game.score(6)
  #     game.score(4)
  #     game.score(4)
  #     expect(game.total_score).to eq(18)
  #   end

  #   it 'should not add any bonus if player fails to roll a spare' do
  #     game.score(6)
  #     game.score(3)
  #     game.score(4)
  #     expect(game.total_score).to eq(13)
  #   end
  # end
end
