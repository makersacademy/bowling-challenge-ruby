require 'scoreboard'

describe Scoreboard do
  subject(:scoreboard) { described_class.new }

  describe '#first_roll' do
    it 'stores the first roll of each frame' do
      allow(scoreboard).to receive(:gets).and_return('6')
      scoreboard.first_roll
      expect(scoreboard.frame_score).to eq([6])
      expect(scoreboard.score).to eq([6])
    end
  end

  describe '#second_roll' do
    it 'stores the second roll of each frame' do
      allow(scoreboard).to receive(:gets).and_return('3')
      scoreboard.second_roll
      expect(scoreboard.frame_score).to include(3)
      expect(scoreboard.score).to include(3)
    end
  end
end
