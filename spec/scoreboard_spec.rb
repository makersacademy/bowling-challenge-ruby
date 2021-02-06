require 'scoreboard'

describe Scoreboard do
  subject(:game) { described_class.new }

  describe '#score' do
    it 'starts with 0 score' do
      expect(game.score).to eq 0
    end
  end
end
