require 'frame'

RSpec.describe Frame do
  
  it "returns the score for a roll" do
    frame = Frame.new
    score = 0

    frame.add(score)

    expect(frame.scores).to eq [0]
  end

end