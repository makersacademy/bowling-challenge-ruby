require 'scorecard'
require 'frame'

RSpec.describe ScoreCard do

  context ".update_pending_bonuses" do
    it "updates the bonus for current_frame-1 if two balls have been played in this frame" do
      
      frame_1 = Frame.new(1)
      frame_1.add_ball_score(1, 'X')

      frame_2 = Frame.new(2)
      frame_2.add_ball_score(1, 3)
      frame_2.add_ball_score(2, 4)

      frames = {1 => frame_1, 2 => frame_2}
      current_frame = 2

      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)

      expect(frame_1.score).to eq 17
    end

    it "updates the bonus for current_frame-2 if current_frame and current_frame-1 are strikes" do
      
      frame_1 = Frame.new(1)
      frame_1.add_ball_score(1, 'X')

      frame_2 = Frame.new(2)
      frame_2.add_ball_score(1, 'X')

      frame_3 = Frame.new(3)
      frame_3.add_ball_score(1, 'X')

      frames = {1 => frame_1, 2 => frame_2, 3 => frame_3}
      current_frame = 3

      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)

      expect(frame_1.score).to eq 30
    end

    it "updates the bonus for current_frame-1 if it had a spare" do
      
      frame_1 = Frame.new(1)
      frame_1.add_ball_score(1, 3)
      frame_1.add_ball_score(2, '/')

      frame_2 = Frame.new(2)
      frame_2.add_ball_score(1, 5)

      frames = {1 => frame_1, 2 => frame_2}
      current_frame = 2

      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)

      expect(frame_1.score).to eq 15
    end
  end
end