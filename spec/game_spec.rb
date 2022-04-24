require_relative '../lib/game'

describe Game do
  context '#frame' do
    it 'increases the round (frame) number' do
      expect(subject.change_frame).to eq 2
    end
  end

  context '#total_score' do
    it 'calculates the users total score' do
      game = Game.new
      game.frame.knocked_down_pins(5)
      game.frame.knocked_down_pins(5)
      expect(game.total_score).to eq 10
    end
  end
end