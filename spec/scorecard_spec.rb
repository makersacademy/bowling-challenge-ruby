# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:score133) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }
  let(:score300) { [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] }
  let(:score0) { [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
  let(:score_unfinished) { [4, 5, 2, 2, 6, 0, 10, 5, 2, 10, 10 ] }
  let(:game133) { Scorecard.new(score133) }
  let(:game300) { Scorecard.new(score300) }
  let(:game0) { Scorecard.new(score0) }
  let(:game_unfinished) { Scorecard.new(score_unfinished) }
  let(:game_default) { Scorecard.new }

  it 'sets @bowls to the passed argument value when initialized' do
    expect(game133.bowls).to eq score133
    expect(game300.bowls).to eq score300
    expect(game0.bowls).to eq score0
  end

  it 'sets @bowls to the default value if initialized with no arguments passed ' do
    expect(game_default.bowls).to eq Scorecard::DEFAULT_BOWLS
  end

  describe '#frames' do
    it 'sorts the @bowls list into frames' do
      expect(game133.frames).to eq [
        [1, 4], [4, 5], [6, 4], [5, 5], [10, 0], [0, 1], [7, 3], [6, 4], [10, 0], [2, 8], [6]
      ]
    end
  end

  describe '#score' do
    it 'returns the final score value' do
      expect(game133.score).to eq 133
      expect(game300.score).to eq 300
      expect(game0.score).to eq 0
    end

    it 'works with unfinished games' do
      expect(game_unfinished.score).to eq 73
    end
  end

  describe '#accumulative_scores' do
    it 'returns an array counting up to the final score with each frame' do
      expect(game133.accumulative_scores).to eq [
        5, 14, 29, 49, 60, 61, 77, 97, 117, 133
      ]
    end

    it 'works with unfinished games' do
      expect(game_unfinished.accumulative_scores).to eq [ 9, 13, 19, 36, 43, 63, 73 ]
    end
  end
end
