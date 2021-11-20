require 'bowling_scorecard'

describe BowlingScorecard do
  let(:scorecard) { BowlingScorecard.new('Ryan') }

  describe '#initialize' do
    it 'has a name assigned to the scorecard' do
      expect(scorecard.name).to eq "Ryan"
    end
  end
end