require 'scorecard'

describe Scorecard do
  subject(:scorecard) { described_class.new }

  describe '#frames' do
    it 'returns the array of rolls (which begins empty)' do
      expect(scorecard.frames).to eq([])
    end
  end



  describe '#turn' do
    it 'adds a turn array to frames ' do
      scorecard.turn(2, 2)
      expect(scorecard.frames).to eq([[2, 2]])
    end

    it 'enters a strike frame as only ball1' do
      scorecard.turn(10)
      expect(scorecard.frames).to eq([[10]])
    end

    it 'does not enter strikes as ball1 and ball2 even if a ball2 is provided' do
      scorecard.turn(10, 0)
      expect(scorecard.frames).not_to eq([[10, 0]])
    end

    it 'raises an InvalidScoreError if an ivalid score is entered' do
      expect { scorecard.turn(9, 9) }.to raise_error(InvalidScoreError)
    end

    context 'if it is the final frame and a strike or spare occurs' do
      it 'adds a bonus ball' do
        9.times do 
          scorecard.turn(5,0)
        end
        scorecard.turn(10, 0, 1)
        expect(scorecard.frames[-1]).to eq([10, 0, 1])
      end

      it 'raises an InvalidScoreError if an ivalid score is entered' do
        expect { scorecard.turn(11, 2, 11) }.to raise_error(InvalidScoreError)
      end 
    end

  end

end