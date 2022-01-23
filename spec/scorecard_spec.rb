# frozen_string_literal: true

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

  describe '#total_score' do
    it 'returns a the total score (which starts at 0)' do
      expect(scorecard.total_score).to eq(0)
    end
  end

  describe '#bonus_score' do
    it 'returns a the bonus score (which starts at 0)' do
      expect(scorecard.bonus_score).to eq(0)
    end
  end

  describe '#add_frame' do
    it 'adds a frame hash to the frames array' do
      scorecard.add_frame(3, 5)
      expect(scorecard.frames.first).to eq({ 'roll1' => 3, 'roll2' => 5 })
    end

    it 'lets user add multiple frame hashes (frame key increments)' do
      scorecard.add_frame(3, 5)
      scorecard.add_frame(4, 2)
      expect(scorecard.frames).to include({ 'roll1' => 3, 'roll2' => 5 },
                                          { 'roll1' => 4, 'roll2' => 2 })
    end

    it 'raises an InvalidScoreError if an ivalid score is entered' do
      expect { scorecard.add_frame(9, 9) }.to raise_error(InvalidScoreError)
    end

    context 'when it is the final frame and a strike or spare is scored' do
      before do
        9.times do
          scorecard.add_frame(3, 2)
        end
      end

      it 'adds a final_frame hash to the frames array with 3 rolls' do
        scorecard.add_frame(1, 9, 10)
        expect(scorecard.frames[-1]).to eq('frame 10' => { 'roll1' => 1, 'roll2' => 9, 'roll3' => 10 })
      end

      context 'if the total of the final frame score is invalid' do
        it 'raises an InvalidScoreError (2 valid strikes and invalid enntry)' do
          expect { scorecard.add_frame(10, 10, 12) }.to raise_error(InvalidScoreError)
        end

        it 'raises an InvalidScoreError (no spair and bowler takes bonus roll)' do
          expect { scorecard.add_frame(1, 1, 10) }.to raise_error(InvalidScoreError)
        end
      end
    end
  end
end
