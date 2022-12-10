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

    expect(score_card.new_frame).to be_instance_of(Frame)
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
  end
end
