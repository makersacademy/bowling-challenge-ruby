require 'bowling_scorecard'

describe BowlingScorecard do

    before do
      @current_game = described_class.new('Ryan')
    end

    let(:scorecard) { BowlingScorecard.new("Ryan") }

    describe '#initialize' do
      it 'has a name assigned to the scorecard' do
        expect(scorecard.name).to eq "Ryan"
      end
    end

    describe '.start_game' do
      it 'creates an instance of a new Bowling Scorecard with a name and an empty frames array' do
        BowlingScorecard.start_bowling("Ryan")
        expect(scorecard).to be_a BowlingScorecard
        expect(scorecard.name).to eq "Ryan"
        expect(scorecard.frames.count).to eq 0
      end
    end
  
end