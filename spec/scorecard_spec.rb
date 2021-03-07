require 'scorecard'
require 'frame'

describe Scorecard do
  it 'should return 133 for wiki example game' do
    scorecard = described_class.new(Frame.new(1, 4))
    scorecard.add_frame(Frame.new(4, 5))
    scorecard.add_frame(Frame.new(6, 4))
    scorecard.add_frame(Frame.new(5, 5))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(0, 1))
    scorecard.add_frame(Frame.new(7, 3))
    scorecard.add_frame(Frame.new(6, 4))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(2, 8, 6))
    expect(scorecard.final_score).to eq 133
  end
  it 'should return 300 for perfect game' do
    scorecard = described_class.new(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10))
    scorecard.add_frame(Frame.new(10, 10, 10))
    expect(scorecard.final_score).to eq 300
  end
  it 'should return 0 for gutter game' do
    scorecard = described_class.new(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    scorecard.add_frame(Frame.new(0, 0))
    expect(scorecard.final_score).to eq 0
  end
end
