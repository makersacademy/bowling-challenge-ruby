require 'scoreboard'


describe Scoreboard do
  subject(:scoreboard) { described_class.new }

  describe '#first_roll' do
    it 'stores the first roll of each frame' do
      allow(scoreboard).to receive(:gets).and_return('6')
      scoreboard.first_roll
      expect(scoreboard.frame_score).to eq(1 => [6])
    end
  end

  describe '#second_roll' do
    it 'stores the second roll of each frame' do
      allow(scoreboard).to receive(:gets).and_return('6')
      scoreboard.first_roll
      allow(scoreboard).to receive(:gets).and_return('3')
      scoreboard.second_roll
      expect(scoreboard.frame_score).to eq(1 => [6, 3])
    end
  end 

  describe '#strike?' do
    it 'returns true if you knock all 10 pins down with one roll' do
      allow(scoreboard).to receive(:gets).and_return('10')
      scoreboard.first_roll
      expect(scoreboard.strike?).to eq true
    end
  end

  describe '#total' do
    it 'shows the total score' do
      allow(scoreboard).to receive(:gets).and_return('6')
      scoreboard.first_roll
      allow(scoreboard).to receive(:gets).and_return('2')
      scoreboard.second_roll
      expect(scoreboard.total).to eq(8)
    end
  end

  describe '#bonus_roll' do
    it 'should add the bonus point to your score' do
      allow(scoreboard).to receive(:gets).and_return('10')
      scoreboard.first_roll
      allow(scoreboard).to receive(:gets).and_return('6')
      scoreboard.bonus_roll
      allow(scoreboard).to receive(:gets).and_return('2')
      scoreboard.second_roll
      last_roll = scoreboard.frame_score[1]
      expect(last_roll).to include(6)
    end
  end
end
