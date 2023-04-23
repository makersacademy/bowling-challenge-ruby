require 'game'

RSpec.describe Game do
  describe '#initialize' do
    it 'creates a new scorecard, current frame, frames array, and roll count' do
      game = Game.new

      expect(game.scorecard).to be_a(Scorecard)
      expect(game.current_frame).to be_a(Frame)
      expect(game.frames).to eq([game.current_frame])
      expect(game.roll_count).to eq(0)
    end
  end
end
