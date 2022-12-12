require 'score_card'
require 'frame'

# useful to keep this so you can see the score for each frame. Paste it before the expect statements:
# p "#{score_card.frames.each do |record| puts "frame: #{record.frame} roll_1: #{record.roll_1} roll_2: #{record.roll_2} bonus: #{record.bonus} frame_total: #{record.frame_score}"  end}"
# p "total score: #{score_card.total_score}"

describe ScoreCard do
  it "initializes a new score card" do
    score_card = ScoreCard.new
    
    expect(score_card).to be_instance_of(ScoreCard)
    expect(score_card.frames).to eq([])
  end
  it "generates a new frame" do
    score_card = ScoreCard.new

    expect(score_card.new_frame(1)).to be_instance_of(Frame)
  end
  context "total score" do
    it "returns a total score of 30 if a player hits a strike on the first two frames" do
      score_card = ScoreCard.new
      score_card.play_frame(10, 0)
      score_card.play_frame(10, 0)
  
      expect(score_card.total_score).to eq 30
    end
    it "returns a total score of 16 if the player hits 4, 6, 2, 1 on the first two frames" do
      score_card = ScoreCard.new
      score_card.play_frame(4, 6)
      score_card.play_frame(2, 1)

      expect(score_card.total_score).to eq 15
    end
    it "returns a total score of 5 if the player hits, 1, 1, 2, 1 on the first two frames" do
      score_card = ScoreCard.new
      score_card.play_frame(1, 1)
      score_card.play_frame(2, 1)

      expect(score_card.total_score).to eq 5
    end

    it "keeps track of the score by adding frame_scores together" do
      score_card = ScoreCard.new
      score_card.play_frame(4, 3)
      score_card.play_frame(3, 3)
      expect(score_card.total_score).to eq 13
    end
  end
  context "where the player hits a strike" do
    it "ends the frame if the player gets 10 on the first roll" do
      score_card = ScoreCard.new
      score_card.play_frame(10, 1)

      expect(score_card.current_frame).to eq 2
    end
    it "records two rolls in the frame and the second roll is zero" do
      score_card = ScoreCard.new
      score_card.play_frame(10, 4)

      expect(score_card.prev_frame.roll_1).to eq 10
      expect(score_card.prev_frame.roll_2).to eq 0
    end
  end
  context "where a previous frame exists" do
    it "returns the previous frame" do
      score_card = ScoreCard.new
      score_card.play_frame(10, 0)
      score_card.play_frame(10, 0)
      score_card.play_frame(10, 0)
      # since it automatically starts a new round/frame once a frame has been played, this counts as being in the 4th round.

      expect(score_card.prev_frame).to eq score_card.frames[2]
    end
    it "can see that a previous frame was a strike" do
      score_card = ScoreCard.new
      score_card.play_frame(10, 0)
      expect(score_card.prev_frame.is_strike?).to eq true
    end
  end
  context "where the previous round was a strike" do
    it "adds the next two rolls to the previous frame bonus" do
      score_card = ScoreCard.new
      score_card.play_frame(10, 1)
      score_card.play_frame(2, 2)

      expect(score_card.frames[0].bonus).to eq 4
    end
  end
  context "where the previous round was a spare" do
    it "adds the first roll to the previous frame bonus" do
      score_card = ScoreCard.new
      score_card.play_frame(9, 1)
      score_card.play_frame(2, 2)

      expect(score_card.frames[0].bonus).to eq 2
    end
  end
  context "where the player hits a spare" do
    it "records two rolls in the frame" do
      score_card = ScoreCard.new
      score_card.play_frame(6, 4)

      expect(score_card.prev_frame.roll_1).to eq 6
      expect(score_card.prev_frame.roll_2).to eq 4
    end
    it "can see that a previous frame was a spare" do
      score_card = ScoreCard.new
      score_card.play_frame(6, 4)
      expect(score_card.prev_frame.is_spare?).to eq true
    end
  end
  context "where the player doesn't hit a strike or a spare" do
    it "records two rolls in the frame" do
    score_card = ScoreCard.new
    score_card.play_frame(4, 3)

    expect(score_card.prev_frame.roll_1).to eq 4
    expect(score_card.prev_frame.roll_2).to eq 3
    end
    it "can see that the previous round was neither a strike nor a spare" do
      score_card = ScoreCard.new
      score_card.play_frame(4, 3)
  
      expect(score_card.prev_frame.is_strike?).to eq false
      expect(score_card.prev_frame.is_spare?).to eq false
    end
  end
  it "keeps a total score for all frames" do
    score_card = ScoreCard.new
    score_card.play_frame(3, 3)
    score_card.play_frame(10, 0)
    score_card.play_frame(2, 2)
    score_card.play_frame(9, 1)
    score_card.play_frame(2, 2)


    expect(score_card.total_score).to eq 40
  end
  it "returns you got a gutter game if score is zero after ten frames" do
    score_card = ScoreCard.new
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
    score_card.play_frame(0, 0)
   
    expect(score_card.result).to eq "You got a gutter game!"
  end
  it "returns 'you got a perfect game' if score is 300 after ten frames" do
    score_card = ScoreCard.new
    score_card.play_frame(10, 0)
    score_card.play_frame(10, 0)
    score_card.play_frame(10, 0)
    score_card.play_frame(10, 0)
    score_card.play_frame(10, 0)
    score_card.play_frame(10, 0)   
    score_card.play_frame(10, 0)  
    score_card.play_frame(10, 0)    
    score_card.play_frame(10, 0)   
    score_card.play_frame(10, 0)
      
    expect(score_card.result).to eq "You got a perfect game!!"
  end
  it "returns 'well played you scored: {score}' after the 10th frame" do
    score_card = ScoreCard.new
    score_card.play_frame(10, 0)
    score_card.play_frame(2, 2)
    score_card.play_frame(2, 2)
    score_card.play_frame(2, 2)
    score_card.play_frame(1, 9)
    score_card.play_frame(2, 2)   
    score_card.play_frame(2, 2)  
    score_card.play_frame(2, 2)    
    score_card.play_frame(2, 2)   
    score_card.play_frame(2, 2)

    expect(score_card.result).to eq "Well played, you scored: 58"
  end
  it "adds a bonus roll to 2 frames prior" do
    score_card = ScoreCard.new
    score_card.play_frame(3, 4)
    score_card.play_frame(2, 2)
    score_card.prev_two_frames.add_bonus(3)
    
    expect(score_card.frames[0].frame_score).to eq 10
  end
  it "adds a bonus roll to the previous frame" do
    score_card = ScoreCard.new
    score_card.play_frame(4, 5)
    score_card.play_frame(3, 2)
    score_card.prev_frame.add_bonus(2)

    expect(score_card.frames[1].frame_score).to eq 7
  end
end


