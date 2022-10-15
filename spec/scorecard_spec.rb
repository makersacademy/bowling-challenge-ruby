# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  let(:game_unfinished) { Scorecard.new([3, 4, 5, 2, 10, 1, 2]) }
  let(:game_perfect) { Scorecard.new([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]) }

  it 'sets @bowls to the default value if initialized with no arguments passed ' do
    expect(Scorecard.new.bowls).to eq Scorecard::DEFAULT_BOWLS
  end

  describe '#score' do
    it 'returns the score value' do
      expect(subject.score).to eq 10
      expect(game_unfinished.score).to eq 4
    end

    it 'does not add end-of-game bonus bowls as their own frames' do
      expect(game_perfect.score).to eq 10
    end
  end

  describe '#accumulative_scores' do
    it 'returns an array counting up to the score with each frame' do
      expect(subject.accumulative_scores).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    end
  end
end
