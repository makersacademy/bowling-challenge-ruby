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

  describe '#run' do
    it 'runs the scoreboard' do
      scoreboard.run
      expect(scoreboard.score.length).to eq 20
    end
  end

  describe '#strike' do
    it 'adds to the previous frame_score the score of this frame' do
      allow(scoreboard).to receive(:gets).and_return('10')
      scoreboard.first_roll
      expect(scoreboard.strike?).to eq true
    end
  end
end
