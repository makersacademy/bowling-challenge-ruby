# frozen_string_literal: true

require 'scorecard'

describe ScoreCard do
  subject(:scorecard) { ScoreCard.new }

  it 'takes the first roll score' do
    expect(scorecard.roll(4)).to eq 4
  end

  it 'starts a new frame after 2 rolls' do
    3.times { scorecard.roll(4) }
    expect(scorecard.frame_count).to eq 2
  end

  it "counts whether it's the first or second roll" do
    3.times { scorecard.roll(4) }
    expect(scorecard.roll_count).to eq 1
  end

  it 'adds the knocked pins to an array' do
    scorecard.roll(4)
    scorecard.roll(2)
    expect(scorecard.pins).to include 4 && 2
  end

  describe ".frame_score" do
    it 'calculates the frame score after 1 roll' do
      scorecard.roll(4)
      expect(scorecard.frame_score).to eq 4
    end

    it 'calculates the frame score after 2 rolls' do
      2.times { scorecard.roll(4) }
      expect(scorecard.total_score).to eq 8
    end

    it 'resets and calculates the frame score after 3 rolls' do
      3.times { scorecard.roll(4) }
      expect(scorecard.frame_score).to eq 4
    end

    it 'calculates the frame score after 4 rolls' do
      4.times { scorecard.roll(4) }
      expect(scorecard.frame_score).to include 8
    end
  end

  describe ".strike" do
    it "skips the frame after the strike" do
      scorecard.roll(ScoreCard::MAX_PINS)
      expect(scorecard.frames).to include ScoreCard::MAX_PINS
      2.times { scorecard.roll(4) }
      expect(scorecard.frames).to include 8
    end

    it "calculates strike score correctly" do
      scorecard.roll(ScoreCard::MAX_PINS)
      2.times { scorecard.roll(4) }
      expect(scorecard.total_score).to eq ScoreCard::MAX_PINS + 16
    end
  end

  describe ".spare" do
    it "calculates spare correctly" do
      scorecard.roll(ScoreCard::MAX_PINS - 4)
      3.times { scorecard.roll(4) }
      expect(scorecard.total_score).to eq ScoreCard::MAX_PINS + 12
      
    end
  end

  describe "edge cases" do
    it 'raises an error when rolling incorrect amount of pins' do
      expect { scorecard.roll(-1) }.to raise_error("incorrect number of pins")
      expect { scorecard.roll(ScoreCard::MAX_PINS + 1)}.to raise_error("incorrect number of pins")
    end
  end
end
