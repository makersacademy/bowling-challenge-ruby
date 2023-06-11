require 'scorecard'
require 'frame'

RSpec.describe ScoreCard do

  context ".update_pending_strikes" do
    it "updates the bonus for current_frame-1 if two balls have been played in this frame" do
      
      frame_1 = Frame.new
      frame_1.strike(1)

      frame_2 = Frame.new
      frame_2.add_ball_score(1, 3)
      frame_2.add_ball_score(2, 4)

      frames = {1 => frame_1, 2 => frame_2}
      current_frame = 2

      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)

      expect(frame_1.total_frame_score).to eq 17
    end

    it "updates the bonus for current_frame-2 if current_frame and current_frame-1 are strikes" do
      
      frame_1 = Frame.new
      frame_1.strike(1)

      frame_2 = Frame.new
      frame_2.strike(1)

      frame_3 = Frame.new
      frame_3.strike(1)

      frames = {1 => frame_1, 2 => frame_2, 3 => frame_3}
      current_frame = 3
      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)
      expect(frame_1.total_frame_score).to eq 30
    end
    
    it "updates the bonus for frame 9 if frame 9 had a strike and the first two balls of frame 10 are strikes" do
      frame_8 = Frame.new
      
      frame_9 = Frame.new
      frame_9.strike(1)
    
      frame_10 = Frame.new
      frame_10.strike(1)
      frame_10.strike(2)
    
      frames = {8 => frame_8, 9 => frame_9, 10 => frame_10}
      current_frame = 10
    
      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)
    
      expect(frame_9.total_frame_score).to eq 30
    end
    
    it "doesn't apply a bonus if ball 3 of frame 10 is a strike" do
      frame_8 = Frame.new
      
      frame_9 = Frame.new
      frame_9.strike(1)
    
      frame_10 = Frame.new
      frame_10.strike(1)
      frame_10.strike(2)
      
      frames = {8 => frame_8, 9 => frame_9, 10 => frame_10}
      current_frame = 10
    
      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)
    
      expect(frame_9.total_frame_score).to eq 30
      expect(frame_10.total_frame_score).to eq 20
      
      frame_10.strike(3)
      
      score_card.update_pending_bonuses(frames, current_frame)
      
      expect(frame_9.total_frame_score).to eq 30
      expect(frame_10.total_frame_score).to eq 30
    end
  end
  context ".update_pending_spares" do
    it "updates the bonus for current_frame-1 if it had a spare" do
      
      frame_1 = Frame.new
      frame_1.add_ball_score(1, 3)
      frame_1.spare

      frame_2 = Frame.new
      frame_2.add_ball_score(1, 5)

      frames = {1 => frame_1, 2 => frame_2}
      current_frame = 2

      score_card = ScoreCard.new
      score_card.update_pending_bonuses(frames, current_frame)

      expect(frame_1.total_frame_score).to eq 15
    end
  end
end
