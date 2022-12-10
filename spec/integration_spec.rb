require "scores"
require "frame"

RSpec.describe "integration" do 
  it "shows all rolls" do 
    frame_1 = Frame.new(1,1)
    frame_2 = Frame.new(2,2)
    scores = Scores.new 
    scores.add(frame_1)
    scores.add(frame_2)
    expect(scores.all).to eq([frame_1, frame_2])
  end 
end 

    