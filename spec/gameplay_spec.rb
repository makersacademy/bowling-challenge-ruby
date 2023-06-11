require 'gameplay'
require 'frame'

RSpec.describe Gameplay do
  context ".continue?" do
    it "returns true if the game should continue" do
      frame_1 = Frame.new
      frames = { 1 => frame_1 }
      game = Gameplay.new
      expect(game.continue?(frames)).to eq true
    end
  end

  context ".next_ball" do
    it "increments the current ball and frame" do
      frame_1 = Frame.new
      frame_1.add_ball_score(1, '3')
      frame_1.add_ball_score(2, '4')
      
      frame_2 = Frame.new
      frame_2.strike(1)
      
      frame_3 = Frame.new
      frame_3.add_ball_score(1, '2')
      
      frames = {1 => frame_1, 2 => frame_2, 3 => frame_3}
      
      game = Gameplay.new
      expect(game.current_frame).to eq 1
      expect(game.current_ball).to eq 1
      game.next_ball(frames)
      expect(game.current_frame).to eq 1
      expect(game.current_ball).to eq 2
      game.next_ball(frames)
      expect(game.current_frame).to eq 2
      expect(game.current_ball).to eq 1
      game.next_ball(frames)
      expect(game.current_frame).to eq 3
      expect(game.current_ball).to eq 1
    end
  end
end
