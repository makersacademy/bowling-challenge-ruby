require "scores"
require "frame"

RSpec.describe "integration" do 
  it "shows all rolls without bonuses" do 
    frame_1 = Frame.new(1,1)
    frame_2 = Frame.new(2,2)
    scores = Scores.new 
    scores.add(frame_1)
    scores.add(frame_2)
    expect(scores.all).to eq([frame_1, frame_2])
  end

  it "gets a gutter game and returns 0" do
    scores = Scores.new 
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    scores.add(Frame.new.(0,0))
    expect(scores.final_score).to eq 0 
  end 
end 

    