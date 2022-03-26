# frozen_string_literal: true

require 'scorecard'

describe ScoreCard do
  subject(:scorecard) { ScoreCard.new }

  it 'takes the first roll score' do
    expect(scorecard.roll(4)).to eq 4
  end

  it 'calculates the score after 2 rolls' do
    2.times { scorecard.roll(4) }
    expect(scorecard.score).to eq 8
  end

  it 'starts a new frame after 2 rolls' do
    3.times { scorecard.roll(4) }
    expect(scorecard.frame_count).to eq 2
  end

  it "counts whether it's the first or second roll" do
    3.times { scorecard.roll(4) }
    expect(scorecard.roll_count).to eq 1
  end

  xit 'adds the rolls to an array' do
    scorecard.roll(4)
    scorecard.roll(2)
    expect(scorecard.rolls).to include 4 && 2
  end
end
