require 'bowling_scorecard'

describe BowlingScorecard do
  let(:test_scorecard) { BowlingScorecard.new }
  describe '#enter_roll' do
    it 'receives the roll score and returns it' do
      expect(test_scorecard.enter_roll(5)).to eq 5
    end

    it 'will reject any score over 10' do
      expect(test_scorecard.enter_roll(11)).to eq "Invalid score entered, entered_score must be between 0 and 10."
    end
  end
end
