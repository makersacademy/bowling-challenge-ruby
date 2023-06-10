require 'gameplay'

RSpec.describe Gameplay do
  context ".continue?" do
    it "returns true if the game should continue" do
      game = Gameplay.new
      expect(game.continue?).to eq true
    end
  end

  context ".next_ball" do
    it "increments the current ball and frame" do
      game = Gameplay.new
      expect(game.current_frame).to eq 1
      expect(game.current_ball).to eq 1
      game.next_ball
      expect(game.current_frame).to eq 1
      expect(game.current_ball).to eq 2
      game.next_ball
      expect(game.current_frame).to eq 2
      expect(game.current_ball).to eq 1
    end
  end
end