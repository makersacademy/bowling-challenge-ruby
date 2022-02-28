require 'scoreboard'

describe Scoreboard do
  subject(:scoreboard) { described_class.new }
  describe 'new scoreboard' do
    it 'should set the score to 0 and create a new scoreboard' do
    expect(scoreboard).to be_a Scoreboard
    expect(scoreboard.game_score).to eq 0
    end
  end

  describe 'attempt illegal score' do
    it 'should return an error if frame score is greater than 10' do
      expect { scoreboard.single_roll(14) }.to raise_error("Single throw recorded for throw 1 is invalid")
    end
  end
end