require 'scorecard'

describe Scorecard do
    let(:scorecard) { Scorecard.new }

    describe '#initialize' do
      it 'initializes a new instance of scorecard' do
        expect(scorecard).to be_a Scorecard
      end
    end

    describe '#score' do
      it 'can score a single frame where both rolls equal 0' do
        2.times { scorecard.roll(0) } 
        expect(scorecard.score).to eq 0
      end

      it 'can roll a gutter game' do
        20.times { scorecard.roll(0)}
        expect(scorecard.score).to eq 0
      end


    end

end