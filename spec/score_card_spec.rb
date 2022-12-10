require 'score_card'
require 'frame'

describe ScoreCard do
  it "initializes a new score card" do
    score_card = ScoreCard.new
    
    expect(score_card).to be_instance_of(ScoreCard)
    expect(score_card.frames).to eq([])
  end
  it "generates a random number between 0 and 10" do
    score_card = ScoreCard.new
    
    expect(score_card.random_num).to be_instance_of(Integer)
  end
  it "generates a new frame" do
    score_card = ScoreCard.new

    expect(score_card.new_frame).to be_instance_of(Frame)
  end
end
