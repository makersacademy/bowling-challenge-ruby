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
        20.times { scorecard.roll(0) }
        expect(scorecard.score).to eq 0
      end

      it 'can roll all 1s' do
        20.times { scorecard.roll(1) }
        expect(scorecard.score).to eq 20
      end

      it 'can roll all 2s' do
        20.times { scorecard.roll(2) }
        expect(scorecard.score).to eq 40
      end

    end

    describe '#strike' do
      it 'returns true when strike' do
        expect(scorecard.strike?([10])).to eq true
      end

      it 'returns false when not strike' do
        expect(scorecard.strike?([5, 3])).to eq false
      end
    end

    describe '#spare' do
      it 'returns true when spare' do
        expect(scorecard.spare?([5, 5])).to eq true
      end

      it 'returns false when not spare' do
        expect(scorecard.spare?([5, 3])).to eq false
      end
    end

    #   it 'can score a perfect game of 300 points' do
    #     12.times { scorecard.roll(10) }
    #     expect(scorecard.score).to eq 300
    #   end


end
 #   it 'can roll a spare, followed by a 2' do
    #     2.times { scorecard.roll(5) }
    #     scorecard.roll(2)
    #     scorecard.roll(0)
    #     expect(scorecard.score).to eq 14
    #   end