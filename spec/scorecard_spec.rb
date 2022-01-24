# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  subject(:scorecard) { described_class.new }

  describe '#frames' do
    it 'returns the array of rolls (which begins empty)' do
      expect(scorecard.frames).to eq([])
    end

    it 'has a max capacity of 10 (a full bowling game)' do
      14.times do
        scorecard.turn(3, 4)
      end

      expect(scorecard.frames.length).to eq(10)
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
          scorecard.turn(5, 0)
        end
        scorecard.turn(10, 0, 1)
        expect(scorecard.frames[-1]).to eq([10, 0, 1])
      end

      it 'raises an InvalidScoreError if an ivalid score is entered' do
        expect { scorecard.turn(11, 2, 11) }.to raise_error(InvalidScoreError)
      end
    end
  end

  # private method ? but logic requires testing
  describe '#calculate_score' do
    it 'calculates the score of the frame' do
      scorecard.turn(3, 4)
      expect(scorecard.total_score).to eq(7)
    end

    it 'can calculate a gutter-game' do
      10.times do
        scorecard.turn(0, 0)
      end
      expect(scorecard.total_score).to eq(0)
    end

    it 'can calculate a perfect-game' do
      9.times do
        scorecard.turn(10)
      end
      scorecard.turn(10, 10, 10)
      expect(scorecard.total_score).to eq(300)
    end

    it 'can calculate a game with no strikes or spares' do
      10.times do
        scorecard.turn(5, 2)
      end
      expect(scorecard.total_score).to eq(70)
    end

    it 'can calculate an average-game' do
      scorecard.turn(1, 4)
      scorecard.turn(4, 5)
      scorecard.turn(6, 4)
      scorecard.turn(5, 5)
      scorecard.turn(10, 0)
      scorecard.turn(0, 1)
      scorecard.turn(7, 3)
      scorecard.turn(6, 4)
      scorecard.turn(10, 0)
      scorecard.turn(2, 8, 6)
      expect(scorecard.total_score).to eq(133)
    end

    xit 'can calculate an average-game (further-proof)' do
      scorecard.turn(5, 5)
      scorecard.turn(1, 5)
      scorecard.turn(10, 0)
      scorecard.turn(3, 5)
      scorecard.turn(10, 0)
      scorecard.turn(0, 1)
      scorecard.turn(3, 3)
      scorecard.turn(6, 4)
      scorecard.turn(10, 0)
      scorecard.turn(10, 0, 6)
      expect(scorecard.total_score).to eq(133)
    end
  end
end

