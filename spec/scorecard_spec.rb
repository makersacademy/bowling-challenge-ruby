# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:game133) { Scorecard.new([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]) }
  let(:game300) { Scorecard.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]) }
  let(:game0) { Scorecard.new([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]) }
  let(:game_unfinished) { Scorecard.new([4, 5, 2, 2, 6]) }
  let(:game_unfinishedstrike) { Scorecard.new([4, 5, 2, 2, 6, 0, 10, 5, 2, 10, 10]) }
  let(:game_unfinishedspare) { Scorecard.new([4, 5, 2, 2, 6, 0, 10, 5, 2, 10, 4, 6]) }

  it 'sets @bowls to the default value if initialized with no arguments passed ' do
    expect(Scorecard.new.bowls).to eq Scorecard::DEFAULT_BOWLS
  end

  describe '#score' do
    it 'returns the score value' do
      expect(subject.score).to eq 10
      # expect(game133.score).to eq 133
      # expect(game300.score).to eq 300
      # expect(game0.score).to eq 0
      # expect(game_unfinishedstrike.score).to eq 73
    end
  end

  describe '#accumulative_scores' do
    it 'returns an array counting up to the score with each frame' do
      expect(subject.accumulative_scores).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      # expect(game133.accumulative_scores).to eq [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
      # expect(game_unfinished.accumulative_scores).to eq [9, 13, 19]
      # expect(game_unfinishedstrike.accumulative_scores).to eq [9, 13, 19, 36, 43, 63, 73]
      # expect(game_unfinishedspare.accumulative_scores).to eq [9, 13, 19, 36, 43, 63, 73]
    end
  end
end
