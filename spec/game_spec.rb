require 'game'

RSpec.describe Game do
  describe '#initialize' do
    it 'creates a new scorecard, current frame, frames array, and roll count' do
      game = Game.new

      expect(game.instance_variable_get(:@scorecard)).to be_a(Scorecard)
      expect(game.instance_variable_get(:@current_frame)).to be_a(Frame)
      expect(game.instance_variable_get(:@frames)).to eq([game.instance_variable_get(:@current_frame)])
      expect(game.instance_variable_get(:@roll_count)).to eq(0)
    end
  end
end
