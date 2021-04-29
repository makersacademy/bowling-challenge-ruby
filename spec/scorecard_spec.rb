require 'scorecard'
require 'frame'

describe Scorecard do
  let(:frame) { double(:frame, :is_strike? => false, :is_spare? => false, :base_score => 7, :final_score => 7, :rolls => [4, 3])}
  let(:frame2) { double(:frame, :is_strike? => false, :is_spare? => false, :base_score => 9, :final_score => 9, :rolls => [4, 5])}
  let(:strike) { double(:frame, :is_strike? => true, :is_spare? => false, :base_score => 10, :final_score => 10)}
  let(:spare) { double(:frame, :is_strike? => false, :is_spare? => true, :base_score => 10, :final_score => 10 )}
  subject(:game) { described_class.new(frame) }
  describe '#add_frame' do
    it 'adds a frame to the frames array' do
      expect { game.add_frame(frame) }.to change { game.frames.length }.by 1
    end
    it 'checks if it needs to calculate strike bonus' do
      expect(frame).to receive(:is_strike?)
      game.add_frame(strike)
    end
    it 'checks if it needs to calculate spare bonus' do
      expect(frame).to receive(:is_spare?)
      game.add_frame(strike)
    end
    it 'checks if it needs to calculate second strike bonuses' do
      game.add_frame(frame2)
      expect(frame).to receive(:is_strike?)
      expect(frame2).to receive(:is_strike?)
      game.add_frame(spare)
    end
  end
  describe '#running_total' do
    it 'shows the running total of the game' do
      game.add_frame(strike)
      expect(game.running_total).to eq 17
    end
  end
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
    8.times { scorecard.add_frame(Frame.new(10)) }
    scorecard.add_frame(Frame.new(10, 10, 10))
    expect(scorecard.final_score).to eq 300
  end
  it 'should return 0 for gutter game' do
    scorecard = described_class.new(Frame.new(0, 0))
    9.times { scorecard.add_frame(Frame.new(0, 0)) }
    expect(scorecard.final_score).to eq 0
  end
end
