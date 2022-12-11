require 'score_card'
require 'frame'

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
    it "returns a total score" do
      score_card = ScoreCard.new
  
      expect(score_card.total_score).to eq 0
    end
    it "keeps track of the score by adding a number" do
      score_card = ScoreCard.new
      score_card.add_to_total(5)
      expect(score_card.total_score).to eq 5
    end
    it "keeps track of the score by adding multiple numbers" do
      score_card = ScoreCard.new
      score_card.add_to_total(5)
      expect(score_card.total_score).to eq 5
      score_card.add_to_total(3)
      expect(score_card.total_score).to eq 8
      score_card.add_to_total(4)
      expect(score_card.total_score).to eq 12
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
   
    expect(score_card.result).to eq "You got a perfect game!"
  end
end


