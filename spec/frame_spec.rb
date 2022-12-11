require 'frame'

RSpec.describe Frame do
  
  it "returns the score for a roll" do
    frame = Frame.new
    score = 0

    frame.add_ball(score)

    expect(frame.scores).to eq [0]
  end

  it "returns scores summed" do
    frame = Frame.new
    score_1 = 3
    score_2 = 5
  
    frame.add_ball(score_1)
    frame.add_ball(score_2)
  
    expect(frame.frame_score).to eq 8
  end

  it "returns true if strike" do
    frame = Frame.new
    score = 10
  
    frame.add_ball(score)
  
    expect(frame.strike?).to eq true
  end

  it "returns true if spare" do
    frame = Frame.new
    score_1 = 3
    score_2 = 7
  
    frame.add_ball(score_1)
    frame.add_ball(score_2)
  
    expect(frame.spare?).to eq true
  end
end