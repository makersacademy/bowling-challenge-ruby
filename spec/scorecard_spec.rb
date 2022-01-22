require 'scorecard'
require 'frame'

# As a bowler 
# So I can see my results
# I want to be able to count and sum the scores of my bowling game.

describe Scorecard do
  subject(:scorecard) { described_class.new }

  describe '#frames' do
    it 'returns the array of frames (which begins empty)' do
      expect(scorecard.frames).to eq([])
    end

    it 'has a max capacity of 10 (a full bowling game)' do
      15.times do
        scorecard.add_frame(0, 5)
      end
      expect(scorecard.frames.length).to eq(10)
    end
  end

  describe '#add_frame' do
    it 'adds a frame hash to the frames array' do
      scorecard.add_frame(3, 5)
      expect(scorecard.frames.first).to eq({"frame 1"=>{"roll1"=>3, "roll2"=>5}})
    end

    it 'lets user add multiple frame hashes (frame key increments)' do
      scorecard.add_frame(3, 5)
      scorecard.add_frame(4, 2)
      expect(scorecard.frames).to include({"frame 1"=>{"roll1"=>3, "roll2"=>5}},
                                          {"frame 2"=>{"roll1"=>4, "roll2"=>2}})
    end

    it 'raises an error if an ivalid score is entered' do
      expect{ scorecard.add_frame(9, 9) }.to raise_error(InvalidScoreError)
    end
  end
  
end