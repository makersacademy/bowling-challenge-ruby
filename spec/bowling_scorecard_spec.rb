require 'bowling_scorecard'

describe Scorecard do
  let(:game) { Scorecard.new }
  
  describe "#roll" do
    it 'it adds first and second roll to the scorecard' do
      game.roll(5,3)
      expect(game.scorecard).to include([5,3])
    end

    it 'it sums first and second roll and adds summ to the frame scores array' do
      game.roll(5,3)
      expect(game.frame_scores).to include 8
    end

    it 'incremets frame index by 1 with every roll' do
      game.roll(5,3)
      game.roll(10)
      game.roll(7,2)
      expect(game.frame_index).to eq 2
    end
  end
  
end